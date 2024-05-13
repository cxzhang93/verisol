type Ref;
type ContractName;
const unique null: Ref;
const unique SafeMath: ContractName;
const unique ERC20Basic: ContractName;
const unique BasicToken: ContractName;
const unique ERC20: ContractName;
const unique StandardToken: ContractName;
const unique Ownable: ContractName;
const unique Pausable: ContractName;
const unique PausableToken: ContractName;
const unique BecToken: ContractName;
const unique VeriSol: ContractName;
function ConstantToRef(x: int) returns (ret: Ref);
function BoogieRefToInt(x: Ref) returns (ret: int);
function {:bvbuiltin "mod"} modBpl(x: int, y: int) returns (ret: int);
function keccak256(x: int) returns (ret: int);
function abiEncodePacked1(x: int) returns (ret: int);
function _SumMapping_VeriSol(x: [Ref]int) returns (ret: int);
function abiEncodePacked2(x: int, y: int) returns (ret: int);
function abiEncodePacked1R(x: Ref) returns (ret: int);
function abiEncodePacked2R(x: Ref, y: int) returns (ret: int);
var Balance: [Ref]int;
var DType: [Ref]ContractName;
var Alloc: [Ref]bool;
var balance_ADDR: [Ref]int;
var M_Ref_int: [Ref][Ref]int;
var M_Ref_Ref: [Ref][Ref]Ref;
var M_int_Ref: [Ref][int]Ref;
var Length: [Ref]int;
var now: int;
procedure {:inline 1} FreshRefGenerator() returns (newRef: Ref);
implementation FreshRefGenerator() returns (newRef: Ref)
{
havoc newRef;
assume ((Alloc[newRef]) == (false));
Alloc[newRef] := true;
assume ((newRef) != (null));
}

procedure {:inline 1} HavocAllocMany();
implementation HavocAllocMany()
{
var oldAlloc: [Ref]bool;
oldAlloc := Alloc;
havoc Alloc;
assume (forall  __i__0_0:Ref ::  ((oldAlloc[__i__0_0]) ==> (Alloc[__i__0_0])));
}

procedure boogie_si_record_sol2Bpl_int(x: int);
procedure boogie_si_record_sol2Bpl_ref(x: Ref);
procedure boogie_si_record_sol2Bpl_bool(x: bool);

axiom(forall  __i__0_0:int, __i__0_1:int :: {ConstantToRef(__i__0_0), ConstantToRef(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((ConstantToRef(__i__0_0)) != (ConstantToRef(__i__0_1)))));

axiom(forall  __i__0_0:int, __i__0_1:int :: {keccak256(__i__0_0), keccak256(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((keccak256(__i__0_0)) != (keccak256(__i__0_1)))));

axiom(forall  __i__0_0:int, __i__0_1:int :: {abiEncodePacked1(__i__0_0), abiEncodePacked1(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((abiEncodePacked1(__i__0_0)) != (abiEncodePacked1(__i__0_1)))));

axiom(forall  __i__0_0:[Ref]int ::  ((exists __i__0_1:Ref ::  ((__i__0_0[__i__0_1]) != (0))) || ((_SumMapping_VeriSol(__i__0_0)) == (0))));

axiom(forall  __i__0_0:[Ref]int, __i__0_1:Ref, __i__0_2:int ::  ((_SumMapping_VeriSol(__i__0_0[__i__0_1 := __i__0_2])) == (((_SumMapping_VeriSol(__i__0_0)) - (__i__0_0[__i__0_1])) + (__i__0_2))));

axiom(forall  __i__0_0:int, __i__0_1:int, __i__1_0:int, __i__1_1:int :: {abiEncodePacked2(__i__0_0, __i__1_0), abiEncodePacked2(__i__0_1, __i__1_1)} ((((__i__0_0) == (__i__0_1)) && ((__i__1_0) == (__i__1_1))) || ((abiEncodePacked2(__i__0_0, __i__1_0)) != (abiEncodePacked2(__i__0_1, __i__1_1)))));

axiom(forall  __i__0_0:Ref, __i__0_1:Ref :: {abiEncodePacked1R(__i__0_0), abiEncodePacked1R(__i__0_1)} (((__i__0_0) == (__i__0_1)) || ((abiEncodePacked1R(__i__0_0)) != (abiEncodePacked1R(__i__0_1)))));

axiom(forall  __i__0_0:Ref, __i__0_1:Ref, __i__1_0:int, __i__1_1:int :: {abiEncodePacked2R(__i__0_0, __i__1_0), abiEncodePacked2R(__i__0_1, __i__1_1)} ((((__i__0_0) == (__i__0_1)) && ((__i__1_0) == (__i__1_1))) || ((abiEncodePacked2R(__i__0_0, __i__1_0)) != (abiEncodePacked2R(__i__0_1, __i__1_1)))));
procedure {:inline 1} SafeMath_SafeMath_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation SafeMath_SafeMath_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
// end of initialization
}

procedure {:inline 1} SafeMath_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation SafeMath_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 5} (true);
call SafeMath_SafeMath_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

procedure {:inline 1} mul_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s32: int, b_s32: int) returns (__ret_0_: int);
implementation mul_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s32: int, b_s32: int) returns (__ret_0_: int)
{
var c_s31: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "a"} boogie_si_record_sol2Bpl_int(a_s32);
call  {:cexpr "b"} boogie_si_record_sol2Bpl_int(b_s32);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 6} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 7} (true);
assume ((c_s31) >= (0));
assume ((a_s32) >= (0));
assume ((b_s32) >= (0));
assume (((a_s32) * (b_s32)) >= (0));
c_s31 := (a_s32) * (b_s32);
call  {:cexpr "c"} boogie_si_record_sol2Bpl_int(c_s31);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 8} (true);
assume ((a_s32) >= (0));
assume ((c_s31) >= (0));
assume ((a_s32) >= (0));
assume (((c_s31) div (a_s32)) >= (0));
assume ((b_s32) >= (0));
assert (((a_s32) == (0)) || (((c_s31) div (a_s32)) == (b_s32)));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 9} (true);
assume ((c_s31) >= (0));
__ret_0_ := c_s31;
return;
}

procedure {:inline 1} div_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s50: int, b_s50: int) returns (__ret_0_: int);
implementation div_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s50: int, b_s50: int) returns (__ret_0_: int)
{
var c_s49: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "a"} boogie_si_record_sol2Bpl_int(a_s50);
call  {:cexpr "b"} boogie_si_record_sol2Bpl_int(b_s50);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 12} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 13} (true);
assume ((c_s49) >= (0));
assume ((a_s50) >= (0));
assume ((b_s50) >= (0));
assume (((a_s50) div (b_s50)) >= (0));
c_s49 := (a_s50) div (b_s50);
call  {:cexpr "c"} boogie_si_record_sol2Bpl_int(c_s49);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 14} (true);
assume ((c_s49) >= (0));
__ret_0_ := c_s49;
return;
}

procedure {:inline 1} sub_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s70: int, b_s70: int) returns (__ret_0_: int);
implementation sub_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s70: int, b_s70: int) returns (__ret_0_: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "a"} boogie_si_record_sol2Bpl_int(a_s70);
call  {:cexpr "b"} boogie_si_record_sol2Bpl_int(b_s70);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 17} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 18} (true);
assume ((b_s70) >= (0));
assume ((a_s70) >= (0));
assert ((b_s70) <= (a_s70));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 19} (true);
assume ((a_s70) >= (0));
assume ((b_s70) >= (0));
assume (((a_s70) - (b_s70)) >= (0));
__ret_0_ := (a_s70) - (b_s70);
return;
}

procedure {:inline 1} add_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s94: int, b_s94: int) returns (__ret_0_: int);
implementation add_SafeMath(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, a_s94: int, b_s94: int) returns (__ret_0_: int)
{
var c_s93: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "a"} boogie_si_record_sol2Bpl_int(a_s94);
call  {:cexpr "b"} boogie_si_record_sol2Bpl_int(b_s94);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 22} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 23} (true);
assume ((c_s93) >= (0));
assume ((a_s94) >= (0));
assume ((b_s94) >= (0));
assume (((a_s94) + (b_s94)) >= (0));
c_s93 := (a_s94) + (b_s94);
call  {:cexpr "c"} boogie_si_record_sol2Bpl_int(c_s93);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 24} (true);
assume ((c_s93) >= (0));
assume ((a_s94) >= (0));
assert ((c_s93) >= (a_s94));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 25} (true);
assume ((c_s93) >= (0));
__ret_0_ := c_s93;
return;
}

procedure {:inline 1} ERC20Basic_ERC20Basic_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation ERC20Basic_ERC20Basic_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
totalSupply_ERC20Basic[this] := 0;
// end of initialization
}

procedure {:inline 1} ERC20Basic_ERC20Basic(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation ERC20Basic_ERC20Basic(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 29} (true);
call ERC20Basic_ERC20Basic_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var totalSupply_ERC20Basic: [Ref]int;
procedure {:public} {:inline 1} balanceOf_ERC20Basic(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, who_s104: Ref) returns (__ret_0_: int);
procedure {:public} {:inline 1} transfer_ERC20Basic(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, to_s113: Ref, value_s113: int) returns (__ret_0_: bool);
procedure {:inline 1} BasicToken_BasicToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation BasicToken_BasicToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
// Make array/mapping vars distinct for balances
call __var_1 := FreshRefGenerator();
balances_BasicToken[this] := __var_1;
// Initialize Integer mapping balances
assume (forall  __i__0_0:Ref ::  ((M_Ref_int[balances_BasicToken[this]][__i__0_0]) == (0)));
// end of initialization
}

procedure {:inline 1} BasicToken_BasicToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation BasicToken_BasicToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 36} (true);
call ERC20Basic_ERC20Basic(this, msgsender_MSG, msgvalue_MSG);
call BasicToken_BasicToken_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var balances_BasicToken: [Ref]Ref;
procedure {:public} {:inline 1} transfer_BasicToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _to_s195: Ref, _value_s195: int) returns (__ret_0_: bool);
implementation transfer_BasicToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _to_s195: Ref, _value_s195: int) returns (__ret_0_: bool)
{
var __var_2: Ref;
var __var_3: int;
var __var_4: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_to"} boogie_si_record_sol2Bpl_ref(_to_s195);
call  {:cexpr "_value"} boogie_si_record_sol2Bpl_int(_value_s195);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 41} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 42} (true);
__var_2 := null;
assume ((_to_s195) != (null));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 43} (true);
assume ((_value_s195) >= (0));
assume ((_value_s195) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (0));
assume (((_value_s195) > (0)) && ((_value_s195) <= (M_Ref_int[balances_BasicToken[this]][msgsender_MSG])));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 45} (true);
assume ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (0));
assume ((_value_s195) >= (0));
call __var_3 := sub_SafeMath(this, this, 0, M_Ref_int[balances_BasicToken[this]][msgsender_MSG], _value_s195);
M_Ref_int[balances_BasicToken[this]][msgsender_MSG] := __var_3;
assume ((__var_3) >= (0));
call  {:cexpr "balances[msg.sender]"} boogie_si_record_sol2Bpl_int(M_Ref_int[balances_BasicToken[this]][msgsender_MSG]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 46} (true);
assume ((M_Ref_int[balances_BasicToken[this]][_to_s195]) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][_to_s195]) >= (0));
assume ((_value_s195) >= (0));
call __var_4 := add_SafeMath(this, this, 0, M_Ref_int[balances_BasicToken[this]][_to_s195], _value_s195);
M_Ref_int[balances_BasicToken[this]][_to_s195] := __var_4;
assume ((__var_4) >= (0));
call  {:cexpr "balances[_to]"} boogie_si_record_sol2Bpl_int(M_Ref_int[balances_BasicToken[this]][_to_s195]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 47} (true);
assert {:EventEmitted "Transfer_BasicToken"} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 48} (true);
__ret_0_ := true;
return;
}

procedure {:public} {:inline 1} balanceOf_BasicToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _owner_s207: Ref) returns (balance_s207: int);
implementation balanceOf_BasicToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _owner_s207: Ref) returns (balance_s207: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_owner"} boogie_si_record_sol2Bpl_ref(_owner_s207);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 51} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 52} (true);
assume ((M_Ref_int[balances_BasicToken[this]][_owner_s207]) >= (0));
balance_s207 := M_Ref_int[balances_BasicToken[this]][_owner_s207];
return;
}

procedure {:inline 1} ERC20_ERC20_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation ERC20_ERC20_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
// end of initialization
}

procedure {:inline 1} ERC20_ERC20(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation ERC20_ERC20(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 56} (true);
call ERC20Basic_ERC20Basic(this, msgsender_MSG, msgvalue_MSG);
call ERC20_ERC20_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

procedure {:public} {:inline 1} allowance_ERC20(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, owner_s219: Ref, spender_s219: Ref) returns (__ret_0_: int);
procedure {:public} {:inline 1} transferFrom_ERC20(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, from_s230: Ref, to_s230: Ref, value_s230: int) returns (__ret_0_: bool);
procedure {:public} {:inline 1} approve_ERC20(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, spender_s239: Ref, value_s239: int) returns (__ret_0_: bool);
procedure {:inline 1} StandardToken_StandardToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation StandardToken_StandardToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_5: Ref;
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
// Make array/mapping vars distinct for allowed
call __var_5 := FreshRefGenerator();
allowed_StandardToken[this] := __var_5;
// Initialize length of 1-level nested array in allowed
assume (forall  __i__0_0:Ref ::  ((Length[M_Ref_Ref[allowed_StandardToken[this]][__i__0_0]]) == (0)));
assume (forall  __i__0_0:Ref ::  (!(Alloc[M_Ref_Ref[allowed_StandardToken[this]][__i__0_0]])));
call HavocAllocMany();
assume (forall  __i__0_0:Ref ::  (Alloc[M_Ref_Ref[allowed_StandardToken[this]][__i__0_0]]));
assume (forall  __i__0_0:Ref, __i__0_1:Ref :: {M_Ref_Ref[allowed_StandardToken[this]][__i__0_0], M_Ref_Ref[allowed_StandardToken[this]][__i__0_1]} (((__i__0_0) == (__i__0_1)) || ((M_Ref_Ref[allowed_StandardToken[this]][__i__0_0]) != (M_Ref_Ref[allowed_StandardToken[this]][__i__0_1]))));
// end of initialization
}

procedure {:inline 1} StandardToken_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation StandardToken_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 63} (true);
call ERC20Basic_ERC20Basic(this, msgsender_MSG, msgvalue_MSG);
call ERC20_ERC20(this, msgsender_MSG, msgvalue_MSG);
call BasicToken_BasicToken(this, msgsender_MSG, msgvalue_MSG);
call StandardToken_StandardToken_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var allowed_StandardToken: [Ref]Ref;
procedure {:public} {:inline 1} transferFrom_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _from_s348: Ref, _to_s348: Ref, _value_s348: int) returns (__ret_0_: bool);
implementation transferFrom_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _from_s348: Ref, _to_s348: Ref, _value_s348: int) returns (__ret_0_: bool)
{
var __var_6: Ref;
var __var_7: int;
var __var_8: int;
var __var_9: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_from"} boogie_si_record_sol2Bpl_ref(_from_s348);
call  {:cexpr "_to"} boogie_si_record_sol2Bpl_ref(_to_s348);
call  {:cexpr "_value"} boogie_si_record_sol2Bpl_int(_value_s348);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 66} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 67} (true);
__var_6 := null;
assume ((_to_s348) != (null));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 68} (true);
assume ((_value_s348) >= (0));
assume ((_value_s348) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][_from_s348]) >= (0));
assume (((_value_s348) > (0)) && ((_value_s348) <= (M_Ref_int[balances_BasicToken[this]][_from_s348])));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 69} (true);
assume ((_value_s348) >= (0));
assume ((M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_from_s348]][msgsender_MSG]) >= (0));
assume ((_value_s348) <= (M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_from_s348]][msgsender_MSG]));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 71} (true);
assume ((M_Ref_int[balances_BasicToken[this]][_from_s348]) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][_from_s348]) >= (0));
assume ((_value_s348) >= (0));
call __var_7 := sub_SafeMath(this, this, 0, M_Ref_int[balances_BasicToken[this]][_from_s348], _value_s348);
M_Ref_int[balances_BasicToken[this]][_from_s348] := __var_7;
assume ((__var_7) >= (0));
call  {:cexpr "balances[_from]"} boogie_si_record_sol2Bpl_int(M_Ref_int[balances_BasicToken[this]][_from_s348]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 72} (true);
assume ((M_Ref_int[balances_BasicToken[this]][_to_s348]) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][_to_s348]) >= (0));
assume ((_value_s348) >= (0));
call __var_8 := add_SafeMath(this, this, 0, M_Ref_int[balances_BasicToken[this]][_to_s348], _value_s348);
M_Ref_int[balances_BasicToken[this]][_to_s348] := __var_8;
assume ((__var_8) >= (0));
call  {:cexpr "balances[_to]"} boogie_si_record_sol2Bpl_int(M_Ref_int[balances_BasicToken[this]][_to_s348]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 73} (true);
assume ((M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_from_s348]][msgsender_MSG]) >= (0));
assume ((M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_from_s348]][msgsender_MSG]) >= (0));
assume ((_value_s348) >= (0));
call __var_9 := sub_SafeMath(this, this, 0, M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_from_s348]][msgsender_MSG], _value_s348);
M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_from_s348]][msgsender_MSG] := __var_9;
assume ((__var_9) >= (0));
call  {:cexpr "allowed[_from][msg.sender]"} boogie_si_record_sol2Bpl_int(M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_from_s348]][msgsender_MSG]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 74} (true);
assert {:EventEmitted "Transfer_StandardToken"} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 75} (true);
__ret_0_ := true;
return;
}

procedure {:public} {:inline 1} approve_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _spender_s376: Ref, _value_s376: int) returns (__ret_0_: bool);
implementation approve_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _spender_s376: Ref, _value_s376: int) returns (__ret_0_: bool)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_spender"} boogie_si_record_sol2Bpl_ref(_spender_s376);
call  {:cexpr "_value"} boogie_si_record_sol2Bpl_int(_value_s376);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 78} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 79} (true);
assume ((M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][msgsender_MSG]][_spender_s376]) >= (0));
assume ((_value_s376) >= (0));
M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][msgsender_MSG]][_spender_s376] := _value_s376;
call  {:cexpr "allowed[msg.sender][_spender]"} boogie_si_record_sol2Bpl_int(M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][msgsender_MSG]][_spender_s376]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 80} (true);
assert {:EventEmitted "Approval_StandardToken"} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 81} (true);
__ret_0_ := true;
return;
}

procedure {:public} {:inline 1} allowance_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _owner_s392: Ref, _spender_s392: Ref) returns (remaining_s392: int);
implementation allowance_StandardToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _owner_s392: Ref, _spender_s392: Ref) returns (remaining_s392: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_owner"} boogie_si_record_sol2Bpl_ref(_owner_s392);
call  {:cexpr "_spender"} boogie_si_record_sol2Bpl_ref(_spender_s392);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 84} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 85} (true);
assume ((M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_owner_s392]][_spender_s392]) >= (0));
remaining_s392 := M_Ref_int[M_Ref_Ref[allowed_StandardToken[this]][_owner_s392]][_spender_s392];
return;
}

var owner_Ownable: [Ref]Ref;
procedure {:inline 1} Ownable_Ownable_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation Ownable_Ownable_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
owner_Ownable[this] := null;
// end of initialization
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 94} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 95} (true);
owner_Ownable[this] := msgsender_MSG;
call  {:cexpr "owner"} boogie_si_record_sol2Bpl_ref(owner_Ownable[this]);
}

procedure {:constructor} {:public} {:inline 1} Ownable_Ownable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation Ownable_Ownable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call Ownable_Ownable_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

procedure {:public} {:inline 1} transferOwnership_Ownable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, newOwner_s446: Ref);
implementation transferOwnership_Ownable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, newOwner_s446: Ref)
{
var __var_10: Ref;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "newOwner"} boogie_si_record_sol2Bpl_ref(newOwner_s446);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call onlyOwner_pre(this, msgsender_MSG, msgvalue_MSG);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 103} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 104} (true);
__var_10 := null;
assume ((newOwner_s446) != (null));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 105} (true);
assert {:EventEmitted "OwnershipTransferred_Ownable"} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 106} (true);
owner_Ownable[this] := newOwner_s446;
call  {:cexpr "owner"} boogie_si_record_sol2Bpl_ref(owner_Ownable[this]);
}

procedure {:inline 1} Pausable_Pausable_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation Pausable_Pausable_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
paused_Pausable[this] := false;
// end of initialization
}

procedure {:inline 1} Pausable_Pausable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation Pausable_Pausable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 110} (true);
call Ownable_Ownable(this, msgsender_MSG, msgvalue_MSG);
call Pausable_Pausable_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

var paused_Pausable: [Ref]bool;
procedure {:public} {:inline 1} pause_Pausable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation pause_Pausable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call onlyOwner_pre(this, msgsender_MSG, msgvalue_MSG);
call whenNotPaused_pre(this, msgsender_MSG, msgvalue_MSG);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 126} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 127} (true);
paused_Pausable[this] := true;
call  {:cexpr "paused"} boogie_si_record_sol2Bpl_bool(paused_Pausable[this]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 128} (true);
assert {:EventEmitted "Pause_Pausable"} (true);
}

procedure {:public} {:inline 1} unpause_Pausable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation unpause_Pausable(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call onlyOwner_pre(this, msgsender_MSG, msgvalue_MSG);
call whenPaused_pre(this, msgsender_MSG, msgvalue_MSG);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 131} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 132} (true);
paused_Pausable[this] := false;
call  {:cexpr "paused"} boogie_si_record_sol2Bpl_bool(paused_Pausable[this]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 133} (true);
assert {:EventEmitted "Unpause_Pausable"} (true);
}

procedure {:inline 1} PausableToken_PausableToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation PausableToken_PausableToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
// end of initialization
}

procedure {:inline 1} PausableToken_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation PausableToken_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 137} (true);
call ERC20Basic_ERC20Basic(this, msgsender_MSG, msgvalue_MSG);
call ERC20_ERC20(this, msgsender_MSG, msgvalue_MSG);
call BasicToken_BasicToken(this, msgsender_MSG, msgvalue_MSG);
call StandardToken_StandardToken(this, msgsender_MSG, msgvalue_MSG);
call Ownable_Ownable(this, msgsender_MSG, msgvalue_MSG);
call Pausable_Pausable(this, msgsender_MSG, msgvalue_MSG);
call PausableToken_PausableToken_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

procedure {:public} {:inline 1} transfer_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _to_s526: Ref, _value_s526: int) returns (__ret_0_: bool);
implementation transfer_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _to_s526: Ref, _value_s526: int) returns (__ret_0_: bool)
{
var __var_11: bool;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_to"} boogie_si_record_sol2Bpl_ref(_to_s526);
call  {:cexpr "_value"} boogie_si_record_sol2Bpl_int(_value_s526);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call whenNotPaused_pre(this, msgsender_MSG, msgvalue_MSG);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 139} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 140} (true);
assume ((_value_s526) >= (0));
call __var_11 := transfer_BasicToken(this, msgsender_MSG, msgvalue_MSG, _to_s526, _value_s526);
__ret_0_ := __var_11;
return;
}

procedure {:public} {:inline 1} transferFrom_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _from_s547: Ref, _to_s547: Ref, _value_s547: int) returns (__ret_0_: bool);
implementation transferFrom_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _from_s547: Ref, _to_s547: Ref, _value_s547: int) returns (__ret_0_: bool)
{
var __var_12: bool;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_from"} boogie_si_record_sol2Bpl_ref(_from_s547);
call  {:cexpr "_to"} boogie_si_record_sol2Bpl_ref(_to_s547);
call  {:cexpr "_value"} boogie_si_record_sol2Bpl_int(_value_s547);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call whenNotPaused_pre(this, msgsender_MSG, msgvalue_MSG);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 143} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 144} (true);
assume ((_value_s547) >= (0));
call __var_12 := transferFrom_StandardToken(this, msgsender_MSG, msgvalue_MSG, _from_s547, _to_s547, _value_s547);
__ret_0_ := __var_12;
return;
}

procedure {:public} {:inline 1} approve_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _spender_s565: Ref, _value_s565: int) returns (__ret_0_: bool);
implementation approve_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _spender_s565: Ref, _value_s565: int) returns (__ret_0_: bool)
{
var __var_13: bool;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_spender"} boogie_si_record_sol2Bpl_ref(_spender_s565);
call  {:cexpr "_value"} boogie_si_record_sol2Bpl_int(_value_s565);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call whenNotPaused_pre(this, msgsender_MSG, msgvalue_MSG);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 147} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 148} (true);
assume ((_value_s565) >= (0));
call __var_13 := approve_StandardToken(this, msgsender_MSG, msgvalue_MSG, _spender_s565, _value_s565);
__ret_0_ := __var_13;
return;
}

procedure {:public} {:inline 1} batchTransfer_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _receivers_s676: Ref, _value_s676: int) returns (__ret_0_: bool);
ensures((totalSupply_ERC20Basic[this]) == (_SumMapping_VeriSol(M_Ref_int[balances_BasicToken[this]])));
implementation batchTransfer_PausableToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, _receivers_s676: Ref, _value_s676: int) returns (__ret_0_: bool)
{
var cnt_s675: int;
var amount_s675: int;
var __var_14: int;
var __var_15: int;
var i_s661: int;
var __var_16: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_value"} boogie_si_record_sol2Bpl_int(_value_s676);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call whenNotPaused_pre(this, msgsender_MSG, msgvalue_MSG);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 151} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 152} (true);
assume ((cnt_s675) >= (0));
assume ((Length[_receivers_s676]) >= (0));
cnt_s675 := Length[_receivers_s676];
call  {:cexpr "cnt"} boogie_si_record_sol2Bpl_int(cnt_s675);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 153} (true);
assume ((amount_s675) >= (0));
assume ((__var_14) >= (0));
assume ((cnt_s675) >= (0));
__var_14 := cnt_s675;
assume ((cnt_s675) >= (0));
assume ((_value_s676) >= (0));
assume (((cnt_s675) * (_value_s676)) >= (0));
amount_s675 := (cnt_s675) * (_value_s676);
call  {:cexpr "amount"} boogie_si_record_sol2Bpl_int(amount_s675);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 154} (true);
assume ((cnt_s675) >= (0));
assume ((cnt_s675) >= (0));
assume (((cnt_s675) > (0)) && ((cnt_s675) <= (20)));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 155} (true);
assume ((_value_s676) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (0));
assume ((amount_s675) >= (0));
assume (((_value_s676) > (0)) && ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (amount_s675)));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 157} (true);
assume ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (0));
assume ((amount_s675) >= (0));
call __var_15 := sub_SafeMath(this, this, 0, M_Ref_int[balances_BasicToken[this]][msgsender_MSG], amount_s675);
M_Ref_int[balances_BasicToken[this]][msgsender_MSG] := __var_15;
assume ((__var_15) >= (0));
call  {:cexpr "balances[msg.sender]"} boogie_si_record_sol2Bpl_int(M_Ref_int[balances_BasicToken[this]][msgsender_MSG]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 158} (true);
assume ((i_s661) >= (0));
assume ((cnt_s675) >= (0));
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 158} (true);
assume ((i_s661) >= (0));
i_s661 := 0;
call  {:cexpr "i"} boogie_si_record_sol2Bpl_int(i_s661);
while ((i_s661) < (cnt_s675))
{
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 158} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 159} (true);
assume ((i_s661) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][M_int_Ref[_receivers_s676][i_s661]]) >= (0));
assume ((i_s661) >= (0));
assume ((M_Ref_int[balances_BasicToken[this]][M_int_Ref[_receivers_s676][i_s661]]) >= (0));
assume ((_value_s676) >= (0));
call __var_16 := add_SafeMath(this, this, 0, M_Ref_int[balances_BasicToken[this]][M_int_Ref[_receivers_s676][i_s661]], _value_s676);
M_Ref_int[balances_BasicToken[this]][M_int_Ref[_receivers_s676][i_s661]] := __var_16;
assume ((__var_16) >= (0));
call  {:cexpr "balances[_receivers[i]]"} boogie_si_record_sol2Bpl_int(M_Ref_int[balances_BasicToken[this]][M_int_Ref[_receivers_s676][i_s661]]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 160} (true);
assert {:EventEmitted "Transfer_PausableToken"} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 158} (true);
assume ((i_s661) >= (0));
i_s661 := (i_s661) + (1);
call  {:cexpr "i"} boogie_si_record_sol2Bpl_int(i_s661);
assume ((i_s661) >= (0));
}
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 162} (true);
__ret_0_ := true;
return;
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 163} (true);
assume ((totalSupply_ERC20Basic[this]) >= (0));
assume ((_SumMapping_VeriSol(M_Ref_int[balances_BasicToken[this]])) >= (0));
}

var name_BecToken: [Ref]int;
var symbol_BecToken: [Ref]int;
var version_BecToken: [Ref]int;
var decimals_BecToken: [Ref]int;
procedure {:inline 1} BecToken_BecToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation BecToken_BecToken_NoBaseCtor(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_17: int;
// start of initialization
assume ((msgsender_MSG) != (null));
Balance[this] := 0;
name_BecToken[this] := -1722152289;
symbol_BecToken[this] := -408458914;
version_BecToken[this] := -586715627;
decimals_BecToken[this] := 18;
// end of initialization
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 173} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 174} (true);
assume ((totalSupply_ERC20Basic[this]) >= (0));
assume ((__var_17) >= (0));
assume ((decimals_BecToken[this]) >= (0));
__var_17 := decimals_BecToken[this];
assume ((decimals_BecToken[this]) >= (0));
assume (((decimals_BecToken[this])) >= (0));
assume (((7000000000) * ((decimals_BecToken[this]))) >= (0));
totalSupply_ERC20Basic[this] := (7000000000) * ((decimals_BecToken[this]));
call  {:cexpr "totalSupply"} boogie_si_record_sol2Bpl_int(totalSupply_ERC20Basic[this]);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 175} (true);
assume ((M_Ref_int[balances_BasicToken[this]][msgsender_MSG]) >= (0));
assume ((totalSupply_ERC20Basic[this]) >= (0));
M_Ref_int[balances_BasicToken[this]][msgsender_MSG] := totalSupply_ERC20Basic[this];
call  {:cexpr "balances[msg.sender]"} boogie_si_record_sol2Bpl_int(M_Ref_int[balances_BasicToken[this]][msgsender_MSG]);
}

procedure {:constructor} {:public} {:inline 1} BecToken_BecToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation BecToken_BecToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_17: int;
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
call ERC20Basic_ERC20Basic(this, msgsender_MSG, msgvalue_MSG);
call ERC20_ERC20(this, msgsender_MSG, msgvalue_MSG);
call BasicToken_BasicToken(this, msgsender_MSG, msgvalue_MSG);
call StandardToken_StandardToken(this, msgsender_MSG, msgvalue_MSG);
call Ownable_Ownable(this, msgsender_MSG, msgvalue_MSG);
call Pausable_Pausable(this, msgsender_MSG, msgvalue_MSG);
call PausableToken_PausableToken(this, msgsender_MSG, msgvalue_MSG);
call BecToken_BecToken_NoBaseCtor(this, msgsender_MSG, msgvalue_MSG);
}

procedure {:inline 1} FallbackMethod_BecToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation FallbackMethod_BecToken(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call  {:cexpr "_verisolFirstArg"} boogie_si_record_sol2Bpl_bool(false);
call  {:cexpr "this"} boogie_si_record_sol2Bpl_ref(this);
call  {:cexpr "msg.sender"} boogie_si_record_sol2Bpl_ref(msgsender_MSG);
call  {:cexpr "msg.value"} boogie_si_record_sol2Bpl_int(msgvalue_MSG);
call  {:cexpr "_verisolLastArg"} boogie_si_record_sol2Bpl_bool(true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 182} (true);
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 183} (true);
assume (false);
}

procedure {:inline 1} FallbackDispatch(from: Ref, to: Ref, amount: int);
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (BecToken)) {
call FallbackMethod_BecToken(to, from, amount);
} else if ((DType[to]) == (PausableToken)) {
assume ((amount) == (0));
} else if ((DType[to]) == (Pausable)) {
assume ((amount) == (0));
} else if ((DType[to]) == (Ownable)) {
assume ((amount) == (0));
} else if ((DType[to]) == (StandardToken)) {
assume ((amount) == (0));
} else if ((DType[to]) == (ERC20)) {
assume ((amount) == (0));
} else if ((DType[to]) == (BasicToken)) {
assume ((amount) == (0));
} else if ((DType[to]) == (ERC20Basic)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType(from, to, amount);
}
}

procedure {:inline 1} Fallback_UnknownType(from: Ref, to: Ref, amount: int);
implementation Fallback_UnknownType(from: Ref, to: Ref, amount: int)
{
// ---- Logic for payable function START 
assume ((Balance[from]) >= (amount));
Balance[from] := (Balance[from]) - (amount);
Balance[to] := (Balance[to]) + (amount);
// ---- Logic for payable function END 
}

procedure {:inline 1} send(from: Ref, to: Ref, amount: int) returns (success: bool);
implementation send(from: Ref, to: Ref, amount: int) returns (success: bool)
{
if ((Balance[from]) >= (amount)) {
call FallbackDispatch(from, to, amount);
success := true;
} else {
success := false;
}
}

procedure BoogieEntry_SafeMath();
implementation BoogieEntry_SafeMath()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var tmpNow: int;
assume ((now) >= (0));
assume ((DType[this]) == (SafeMath));
call SafeMath_SafeMath(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
}
}

procedure BoogieEntry_ERC20Basic();
implementation BoogieEntry_ERC20Basic()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var who_s104: Ref;
var __ret_0_balanceOf: int;
var to_s113: Ref;
var value_s113: int;
var __ret_0_transfer: bool;
var tmpNow: int;
assume ((now) >= (0));
assume (((((((DType[this]) == (ERC20Basic)) || ((DType[this]) == (BasicToken))) || ((DType[this]) == (ERC20))) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call ERC20Basic_ERC20Basic(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc who_s104;
havoc __ret_0_balanceOf;
havoc to_s113;
havoc value_s113;
havoc __ret_0_transfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (2)) {
call __ret_0_balanceOf := balanceOf_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, who_s104);
} else if ((choice) == (1)) {
call __ret_0_transfer := transfer_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, to_s113, value_s113);
}
}
}

procedure BoogieEntry_BasicToken();
implementation BoogieEntry_BasicToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s195: Ref;
var _value_s195: int;
var __ret_0_transfer: bool;
var tmpNow: int;
assume ((now) >= (0));
assume (((((DType[this]) == (BasicToken)) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call BasicToken_BasicToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s195;
havoc _value_s195;
havoc __ret_0_transfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (2)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (1)) {
call __ret_0_transfer := transfer_BasicToken(this, msgsender_MSG, msgvalue_MSG, _to_s195, _value_s195);
}
}
}

procedure BoogieEntry_ERC20();
implementation BoogieEntry_ERC20()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var who_s104: Ref;
var __ret_0_balanceOf: int;
var to_s113: Ref;
var value_s113: int;
var __ret_0_transfer: bool;
var owner_s219: Ref;
var spender_s219: Ref;
var __ret_0_allowance: int;
var from_s230: Ref;
var to_s230: Ref;
var value_s230: int;
var __ret_0_transferFrom: bool;
var spender_s239: Ref;
var value_s239: int;
var __ret_0_approve: bool;
var tmpNow: int;
assume ((now) >= (0));
assume (((((DType[this]) == (ERC20)) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call ERC20_ERC20(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc who_s104;
havoc __ret_0_balanceOf;
havoc to_s113;
havoc value_s113;
havoc __ret_0_transfer;
havoc owner_s219;
havoc spender_s219;
havoc __ret_0_allowance;
havoc from_s230;
havoc to_s230;
havoc value_s230;
havoc __ret_0_transferFrom;
havoc spender_s239;
havoc value_s239;
havoc __ret_0_approve;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (5)) {
call __ret_0_balanceOf := balanceOf_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, who_s104);
} else if ((choice) == (4)) {
call __ret_0_transfer := transfer_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, to_s113, value_s113);
} else if ((choice) == (3)) {
call __ret_0_allowance := allowance_ERC20(this, msgsender_MSG, msgvalue_MSG, owner_s219, spender_s219);
} else if ((choice) == (2)) {
call __ret_0_transferFrom := transferFrom_ERC20(this, msgsender_MSG, msgvalue_MSG, from_s230, to_s230, value_s230);
} else if ((choice) == (1)) {
call __ret_0_approve := approve_ERC20(this, msgsender_MSG, msgvalue_MSG, spender_s239, value_s239);
}
}
}

procedure BoogieEntry_StandardToken();
implementation BoogieEntry_StandardToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s195: Ref;
var _value_s195: int;
var __ret_0_transfer: bool;
var _owner_s392: Ref;
var _spender_s392: Ref;
var remaining_s392: int;
var _from_s348: Ref;
var _to_s348: Ref;
var _value_s348: int;
var __ret_0_transferFrom: bool;
var _spender_s376: Ref;
var _value_s376: int;
var __ret_0_approve: bool;
var tmpNow: int;
assume ((now) >= (0));
assume ((((DType[this]) == (StandardToken)) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call StandardToken_StandardToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s195;
havoc _value_s195;
havoc __ret_0_transfer;
havoc _owner_s392;
havoc _spender_s392;
havoc remaining_s392;
havoc _from_s348;
havoc _to_s348;
havoc _value_s348;
havoc __ret_0_transferFrom;
havoc _spender_s376;
havoc _value_s376;
havoc __ret_0_approve;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (5)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (4)) {
call __ret_0_transfer := transfer_BasicToken(this, msgsender_MSG, msgvalue_MSG, _to_s195, _value_s195);
} else if ((choice) == (3)) {
call remaining_s392 := allowance_StandardToken(this, msgsender_MSG, msgvalue_MSG, _owner_s392, _spender_s392);
} else if ((choice) == (2)) {
call __ret_0_transferFrom := transferFrom_StandardToken(this, msgsender_MSG, msgvalue_MSG, _from_s348, _to_s348, _value_s348);
} else if ((choice) == (1)) {
call __ret_0_approve := approve_StandardToken(this, msgsender_MSG, msgvalue_MSG, _spender_s376, _value_s376);
}
}
}

const {:existential true} HoudiniB1_Ownable: bool;
const {:existential true} HoudiniB2_Ownable: bool;
procedure BoogieEntry_Ownable();
implementation BoogieEntry_Ownable()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var newOwner_s446: Ref;
var tmpNow: int;
assume ((now) >= (0));
assume (((((DType[this]) == (Ownable)) || ((DType[this]) == (Pausable))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call Ownable_Ownable(this, msgsender_MSG, msgvalue_MSG);
while (true)
  invariant (HoudiniB1_Ownable) ==> ((owner_Ownable[this]) == (null));
  invariant (HoudiniB2_Ownable) ==> ((owner_Ownable[this]) != (null));
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc newOwner_s446;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (1)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
}
}
}

const {:existential true} HoudiniB1_Pausable: bool;
const {:existential true} HoudiniB2_Pausable: bool;
procedure BoogieEntry_Pausable();
implementation BoogieEntry_Pausable()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var newOwner_s446: Ref;
var tmpNow: int;
assume ((now) >= (0));
assume ((((DType[this]) == (Pausable)) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call Pausable_Pausable(this, msgsender_MSG, msgvalue_MSG);
while (true)
  invariant (HoudiniB1_Pausable) ==> ((owner_Ownable[this]) == (null));
  invariant (HoudiniB2_Pausable) ==> ((owner_Ownable[this]) != (null));
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc newOwner_s446;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (3)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
} else if ((choice) == (2)) {
call pause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
call unpause_Pausable(this, msgsender_MSG, msgvalue_MSG);
}
}
}

const {:existential true} HoudiniB1_PausableToken: bool;
const {:existential true} HoudiniB2_PausableToken: bool;
procedure BoogieEntry_PausableToken();
implementation BoogieEntry_PausableToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s526: Ref;
var _value_s526: int;
var __ret_0_transfer: bool;
var _owner_s392: Ref;
var _spender_s392: Ref;
var remaining_s392: int;
var _from_s547: Ref;
var _to_s547: Ref;
var _value_s547: int;
var __ret_0_transferFrom: bool;
var _spender_s565: Ref;
var _value_s565: int;
var __ret_0_approve: bool;
var newOwner_s446: Ref;
var _receivers_s676: Ref;
var _value_s676: int;
var __ret_0_batchTransfer: bool;
var tmpNow: int;
assume ((now) >= (0));
assume (((DType[this]) == (PausableToken)) || ((DType[this]) == (BecToken)));
call PausableToken_PausableToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
  invariant (HoudiniB1_PausableToken) ==> ((owner_Ownable[this]) == (null));
  invariant (HoudiniB2_PausableToken) ==> ((owner_Ownable[this]) != (null));
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s526;
havoc _value_s526;
havoc __ret_0_transfer;
havoc _owner_s392;
havoc _spender_s392;
havoc remaining_s392;
havoc _from_s547;
havoc _to_s547;
havoc _value_s547;
havoc __ret_0_transferFrom;
havoc _spender_s565;
havoc _value_s565;
havoc __ret_0_approve;
havoc newOwner_s446;
havoc _receivers_s676;
havoc _value_s676;
havoc __ret_0_batchTransfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (9)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (8)) {
call __ret_0_transfer := transfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _to_s526, _value_s526);
} else if ((choice) == (7)) {
call remaining_s392 := allowance_StandardToken(this, msgsender_MSG, msgvalue_MSG, _owner_s392, _spender_s392);
} else if ((choice) == (6)) {
call __ret_0_transferFrom := transferFrom_PausableToken(this, msgsender_MSG, msgvalue_MSG, _from_s547, _to_s547, _value_s547);
} else if ((choice) == (5)) {
call __ret_0_approve := approve_PausableToken(this, msgsender_MSG, msgvalue_MSG, _spender_s565, _value_s565);
} else if ((choice) == (4)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
} else if ((choice) == (3)) {
call pause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (2)) {
call unpause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
call _receivers_s676 := FreshRefGenerator();
call __ret_0_batchTransfer := batchTransfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _receivers_s676, _value_s676);
}
}
}

const {:existential true} HoudiniB1_BecToken: bool;
const {:existential true} HoudiniB2_BecToken: bool;
procedure BoogieEntry_BecToken();
implementation BoogieEntry_BecToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s526: Ref;
var _value_s526: int;
var __ret_0_transfer: bool;
var _owner_s392: Ref;
var _spender_s392: Ref;
var remaining_s392: int;
var _from_s547: Ref;
var _to_s547: Ref;
var _value_s547: int;
var __ret_0_transferFrom: bool;
var _spender_s565: Ref;
var _value_s565: int;
var __ret_0_approve: bool;
var newOwner_s446: Ref;
var _receivers_s676: Ref;
var _value_s676: int;
var __ret_0_batchTransfer: bool;
var tmpNow: int;
assume ((now) >= (0));
assume ((DType[this]) == (BecToken));
call BecToken_BecToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
  invariant (HoudiniB1_BecToken) ==> ((owner_Ownable[this]) == (null));
  invariant (HoudiniB2_BecToken) ==> ((owner_Ownable[this]) != (null));
{
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s526;
havoc _value_s526;
havoc __ret_0_transfer;
havoc _owner_s392;
havoc _spender_s392;
havoc remaining_s392;
havoc _from_s547;
havoc _to_s547;
havoc _value_s547;
havoc __ret_0_transferFrom;
havoc _spender_s565;
havoc _value_s565;
havoc __ret_0_approve;
havoc newOwner_s446;
havoc _receivers_s676;
havoc _value_s676;
havoc __ret_0_batchTransfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (9)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (8)) {
call __ret_0_transfer := transfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _to_s526, _value_s526);
} else if ((choice) == (7)) {
call remaining_s392 := allowance_StandardToken(this, msgsender_MSG, msgvalue_MSG, _owner_s392, _spender_s392);
} else if ((choice) == (6)) {
call __ret_0_transferFrom := transferFrom_PausableToken(this, msgsender_MSG, msgvalue_MSG, _from_s547, _to_s547, _value_s547);
} else if ((choice) == (5)) {
call __ret_0_approve := approve_PausableToken(this, msgsender_MSG, msgvalue_MSG, _spender_s565, _value_s565);
} else if ((choice) == (4)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
} else if ((choice) == (3)) {
call pause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (2)) {
call unpause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
call _receivers_s676 := FreshRefGenerator();
call __ret_0_batchTransfer := batchTransfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _receivers_s676, _value_s676);
}
}
}

procedure {:inline 1} onlyOwner_pre(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation onlyOwner_pre(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 99} (true);
assume ((msgsender_MSG) == (owner_Ownable[this]));
}

procedure {:inline 1} whenNotPaused_pre(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation whenNotPaused_pre(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 117} (true);
assume (!(paused_Pausable[this]));
}

procedure {:inline 1} whenPaused_pre(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
implementation whenPaused_pre(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
assert {:first} {:sourceFile "C:\Users\chengxuan\Documents\verisol\.\BECTokenTest.sol"} {:sourceLine 122} (true);
assume (paused_Pausable[this]);
}

procedure CorralChoice_SafeMath(this: Ref);
implementation CorralChoice_SafeMath(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
}

procedure CorralEntry_SafeMath();
implementation CorralEntry_SafeMath()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((DType[this]) == (SafeMath));
call SafeMath_SafeMath(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_SafeMath(this);
}
}

procedure CorralChoice_ERC20Basic(this: Ref);
implementation CorralChoice_ERC20Basic(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var who_s104: Ref;
var __ret_0_balanceOf: int;
var to_s113: Ref;
var value_s113: int;
var __ret_0_transfer: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc who_s104;
havoc __ret_0_balanceOf;
havoc to_s113;
havoc value_s113;
havoc __ret_0_transfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (2)) {
call __ret_0_balanceOf := balanceOf_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, who_s104);
} else if ((choice) == (1)) {
call __ret_0_transfer := transfer_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, to_s113, value_s113);
}
}

procedure CorralEntry_ERC20Basic();
implementation CorralEntry_ERC20Basic()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume (((((((DType[this]) == (ERC20Basic)) || ((DType[this]) == (BasicToken))) || ((DType[this]) == (ERC20))) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call ERC20Basic_ERC20Basic(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_ERC20Basic(this);
}
}

procedure CorralChoice_BasicToken(this: Ref);
implementation CorralChoice_BasicToken(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s195: Ref;
var _value_s195: int;
var __ret_0_transfer: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s195;
havoc _value_s195;
havoc __ret_0_transfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (2)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (1)) {
call __ret_0_transfer := transfer_BasicToken(this, msgsender_MSG, msgvalue_MSG, _to_s195, _value_s195);
}
}

procedure CorralEntry_BasicToken();
implementation CorralEntry_BasicToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume (((((DType[this]) == (BasicToken)) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call BasicToken_BasicToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_BasicToken(this);
}
}

procedure CorralChoice_ERC20(this: Ref);
implementation CorralChoice_ERC20(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var who_s104: Ref;
var __ret_0_balanceOf: int;
var to_s113: Ref;
var value_s113: int;
var __ret_0_transfer: bool;
var owner_s219: Ref;
var spender_s219: Ref;
var __ret_0_allowance: int;
var from_s230: Ref;
var to_s230: Ref;
var value_s230: int;
var __ret_0_transferFrom: bool;
var spender_s239: Ref;
var value_s239: int;
var __ret_0_approve: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc who_s104;
havoc __ret_0_balanceOf;
havoc to_s113;
havoc value_s113;
havoc __ret_0_transfer;
havoc owner_s219;
havoc spender_s219;
havoc __ret_0_allowance;
havoc from_s230;
havoc to_s230;
havoc value_s230;
havoc __ret_0_transferFrom;
havoc spender_s239;
havoc value_s239;
havoc __ret_0_approve;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (5)) {
call __ret_0_balanceOf := balanceOf_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, who_s104);
} else if ((choice) == (4)) {
call __ret_0_transfer := transfer_ERC20Basic(this, msgsender_MSG, msgvalue_MSG, to_s113, value_s113);
} else if ((choice) == (3)) {
call __ret_0_allowance := allowance_ERC20(this, msgsender_MSG, msgvalue_MSG, owner_s219, spender_s219);
} else if ((choice) == (2)) {
call __ret_0_transferFrom := transferFrom_ERC20(this, msgsender_MSG, msgvalue_MSG, from_s230, to_s230, value_s230);
} else if ((choice) == (1)) {
call __ret_0_approve := approve_ERC20(this, msgsender_MSG, msgvalue_MSG, spender_s239, value_s239);
}
}

procedure CorralEntry_ERC20();
implementation CorralEntry_ERC20()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume (((((DType[this]) == (ERC20)) || ((DType[this]) == (StandardToken))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call ERC20_ERC20(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_ERC20(this);
}
}

procedure CorralChoice_StandardToken(this: Ref);
implementation CorralChoice_StandardToken(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s195: Ref;
var _value_s195: int;
var __ret_0_transfer: bool;
var _owner_s392: Ref;
var _spender_s392: Ref;
var remaining_s392: int;
var _from_s348: Ref;
var _to_s348: Ref;
var _value_s348: int;
var __ret_0_transferFrom: bool;
var _spender_s376: Ref;
var _value_s376: int;
var __ret_0_approve: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s195;
havoc _value_s195;
havoc __ret_0_transfer;
havoc _owner_s392;
havoc _spender_s392;
havoc remaining_s392;
havoc _from_s348;
havoc _to_s348;
havoc _value_s348;
havoc __ret_0_transferFrom;
havoc _spender_s376;
havoc _value_s376;
havoc __ret_0_approve;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (5)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (4)) {
call __ret_0_transfer := transfer_BasicToken(this, msgsender_MSG, msgvalue_MSG, _to_s195, _value_s195);
} else if ((choice) == (3)) {
call remaining_s392 := allowance_StandardToken(this, msgsender_MSG, msgvalue_MSG, _owner_s392, _spender_s392);
} else if ((choice) == (2)) {
call __ret_0_transferFrom := transferFrom_StandardToken(this, msgsender_MSG, msgvalue_MSG, _from_s348, _to_s348, _value_s348);
} else if ((choice) == (1)) {
call __ret_0_approve := approve_StandardToken(this, msgsender_MSG, msgvalue_MSG, _spender_s376, _value_s376);
}
}

procedure CorralEntry_StandardToken();
implementation CorralEntry_StandardToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((((DType[this]) == (StandardToken)) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call StandardToken_StandardToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_StandardToken(this);
}
}

procedure CorralChoice_Ownable(this: Ref);
implementation CorralChoice_Ownable(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var newOwner_s446: Ref;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc newOwner_s446;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (1)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
}
}

procedure CorralEntry_Ownable();
implementation CorralEntry_Ownable()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume (((((DType[this]) == (Ownable)) || ((DType[this]) == (Pausable))) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call Ownable_Ownable(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_Ownable(this);
}
}

procedure CorralChoice_Pausable(this: Ref);
implementation CorralChoice_Pausable(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var newOwner_s446: Ref;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc newOwner_s446;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (3)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
} else if ((choice) == (2)) {
call pause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
call unpause_Pausable(this, msgsender_MSG, msgvalue_MSG);
}
}

procedure CorralEntry_Pausable();
implementation CorralEntry_Pausable()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((((DType[this]) == (Pausable)) || ((DType[this]) == (PausableToken))) || ((DType[this]) == (BecToken)));
call Pausable_Pausable(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_Pausable(this);
}
}

procedure CorralChoice_PausableToken(this: Ref);
implementation CorralChoice_PausableToken(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s526: Ref;
var _value_s526: int;
var __ret_0_transfer: bool;
var _owner_s392: Ref;
var _spender_s392: Ref;
var remaining_s392: int;
var _from_s547: Ref;
var _to_s547: Ref;
var _value_s547: int;
var __ret_0_transferFrom: bool;
var _spender_s565: Ref;
var _value_s565: int;
var __ret_0_approve: bool;
var newOwner_s446: Ref;
var _receivers_s676: Ref;
var _value_s676: int;
var __ret_0_batchTransfer: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s526;
havoc _value_s526;
havoc __ret_0_transfer;
havoc _owner_s392;
havoc _spender_s392;
havoc remaining_s392;
havoc _from_s547;
havoc _to_s547;
havoc _value_s547;
havoc __ret_0_transferFrom;
havoc _spender_s565;
havoc _value_s565;
havoc __ret_0_approve;
havoc newOwner_s446;
havoc _receivers_s676;
havoc _value_s676;
havoc __ret_0_batchTransfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (9)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (8)) {
call __ret_0_transfer := transfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _to_s526, _value_s526);
} else if ((choice) == (7)) {
call remaining_s392 := allowance_StandardToken(this, msgsender_MSG, msgvalue_MSG, _owner_s392, _spender_s392);
} else if ((choice) == (6)) {
call __ret_0_transferFrom := transferFrom_PausableToken(this, msgsender_MSG, msgvalue_MSG, _from_s547, _to_s547, _value_s547);
} else if ((choice) == (5)) {
call __ret_0_approve := approve_PausableToken(this, msgsender_MSG, msgvalue_MSG, _spender_s565, _value_s565);
} else if ((choice) == (4)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
} else if ((choice) == (3)) {
call pause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (2)) {
call unpause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
call _receivers_s676 := FreshRefGenerator();
call __ret_0_batchTransfer := batchTransfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _receivers_s676, _value_s676);
}
}

procedure CorralEntry_PausableToken();
implementation CorralEntry_PausableToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume (((DType[this]) == (PausableToken)) || ((DType[this]) == (BecToken)));
call PausableToken_PausableToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_PausableToken(this);
}
}

procedure CorralChoice_BecToken(this: Ref);
implementation CorralChoice_BecToken(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var _owner_s207: Ref;
var balance_s207: int;
var _to_s526: Ref;
var _value_s526: int;
var __ret_0_transfer: bool;
var _owner_s392: Ref;
var _spender_s392: Ref;
var remaining_s392: int;
var _from_s547: Ref;
var _to_s547: Ref;
var _value_s547: int;
var __ret_0_transferFrom: bool;
var _spender_s565: Ref;
var _value_s565: int;
var __ret_0_approve: bool;
var newOwner_s446: Ref;
var _receivers_s676: Ref;
var _value_s676: int;
var __ret_0_batchTransfer: bool;
var tmpNow: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc _owner_s207;
havoc balance_s207;
havoc _to_s526;
havoc _value_s526;
havoc __ret_0_transfer;
havoc _owner_s392;
havoc _spender_s392;
havoc remaining_s392;
havoc _from_s547;
havoc _to_s547;
havoc _value_s547;
havoc __ret_0_transferFrom;
havoc _spender_s565;
havoc _value_s565;
havoc __ret_0_approve;
havoc newOwner_s446;
havoc _receivers_s676;
havoc _value_s676;
havoc __ret_0_batchTransfer;
havoc tmpNow;
tmpNow := now;
havoc now;
assume ((now) > (tmpNow));
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SafeMath));
assume ((DType[msgsender_MSG]) != (ERC20Basic));
assume ((DType[msgsender_MSG]) != (BasicToken));
assume ((DType[msgsender_MSG]) != (ERC20));
assume ((DType[msgsender_MSG]) != (StandardToken));
assume ((DType[msgsender_MSG]) != (Ownable));
assume ((DType[msgsender_MSG]) != (Pausable));
assume ((DType[msgsender_MSG]) != (PausableToken));
assume ((DType[msgsender_MSG]) != (BecToken));
assume ((DType[msgsender_MSG]) != (VeriSol));
Alloc[msgsender_MSG] := true;
if ((choice) == (9)) {
call balance_s207 := balanceOf_BasicToken(this, msgsender_MSG, msgvalue_MSG, _owner_s207);
} else if ((choice) == (8)) {
call __ret_0_transfer := transfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _to_s526, _value_s526);
} else if ((choice) == (7)) {
call remaining_s392 := allowance_StandardToken(this, msgsender_MSG, msgvalue_MSG, _owner_s392, _spender_s392);
} else if ((choice) == (6)) {
call __ret_0_transferFrom := transferFrom_PausableToken(this, msgsender_MSG, msgvalue_MSG, _from_s547, _to_s547, _value_s547);
} else if ((choice) == (5)) {
call __ret_0_approve := approve_PausableToken(this, msgsender_MSG, msgvalue_MSG, _spender_s565, _value_s565);
} else if ((choice) == (4)) {
call transferOwnership_Ownable(this, msgsender_MSG, msgvalue_MSG, newOwner_s446);
} else if ((choice) == (3)) {
call pause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (2)) {
call unpause_Pausable(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
call _receivers_s676 := FreshRefGenerator();
call __ret_0_batchTransfer := batchTransfer_PausableToken(this, msgsender_MSG, msgvalue_MSG, _receivers_s676, _value_s676);
}
}

procedure CorralEntry_BecToken();
implementation CorralEntry_BecToken()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((DType[this]) == (BecToken));
call BecToken_BecToken(this, msgsender_MSG, msgvalue_MSG);
while (true)
{
call CorralChoice_BecToken(this);
}
}


