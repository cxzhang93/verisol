﻿
namespace VeriSolOutOfBandsSpecsRunner
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    using System.IO;
    using System.Linq;
    using System.Runtime.InteropServices;
    using Microsoft.Extensions.Logging;

    /// <summary>
    /// Running VeriSol when the specifications are provided out of band in a separate Solidity file
    /// Highly experimental!!
    /// </summary>
    class Program
    {
        public static int Main(string[] args)
        {
            if (args.Length < 6)
            {
                Console.WriteLine("Usage:  VeriSolOutOfBandsSpecsRunner <specification.sol> <contractName> <relative-path-from-specification-to-root-contract.sol> <path-to-corral> <path-to-solc> <recusion-bound>");
                Console.WriteLine("\t An (experimental) utility to add formal specification and verification using VeriSol on a smart contract without changing contract sources");
                Console.WriteLine("\t Currently only supports transaction-depth-bounded verification");
                return 1;
            }

            string specFilePath = args[0];
            string contractName = args[1]; // contract Name, often C_VeriSol
            string contractPath = args[2];
            string corralPath = args[3];
            string solcPath = args[4];
            int corralRecursionBound = int.Parse(args[5]); // need validation
            string solcName = GetSolcNameByOSPlatform();

            ILoggerFactory loggerFactory = new LoggerFactory().AddConsole(LogLevel.Information);
            ILogger logger = loggerFactory.CreateLogger("VeriSolRunner");


            HashSet<Tuple<string, string>> ignoredMethods = new HashSet<Tuple<string, string>>();
            foreach (var arg in args.Where(x => x.StartsWith("/ignoreMethod:")))
            {
                Debug.Assert(arg.Contains("@"), $"Error: incorrect use of /ignoreMethod in {arg}");
                Debug.Assert(arg.LastIndexOf("@") == arg.IndexOf("@"), $"Error: incorrect use of /ignoreMethod in {arg}");
                var str = arg.Substring("/ignoreMethod:".Length);
                var method = str.Substring(0, str.IndexOf("@"));
                var contract = str.Substring(str.IndexOf("@") + 1);
                ignoredMethods.Add(Tuple.Create(method, contract));
            }
            Console.WriteLine($"Ignored method/contract pairs ==> \n\t {string.Join(",", ignoredMethods.Select(x => x.Item1 + "@" + x.Item2))}");


            var verisolExecuter = 
                new VeriSolExecuterWithSpecs(
                    specFilePath, 
                    contractName, 
                    contractPath, 
                    corralPath, 
                    solcPath, 
                    solcName, 
                    corralRecursionBound, 
                    ignoredMethods,
                    logger);
            return verisolExecuter.Execute();
        }

        private static string GetSolcNameByOSPlatform()
        {
            string solcName = null;
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                solcName = "solc.exe";
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
            {
                solcName = "solc-static-linux";
            }
            else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX))
            {
                solcName = "solc-mac";
            }
            else
            {
                throw new SystemException("Cannot recognize OS platform");
            }
            return solcName;
        }
    }
}
