¤)
èÊ
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
s
	AssignAdd
ref"T

value"T

output_ref"T" 
Ttype:
2	"
use_lockingbool( 
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
H
ShardedFilename
basename	
shard

num_shards
filename
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*	1.5.0-rc12unknownÈ
Z
counter/initial_valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
k
counter
VariableV2*
_output_shapes
: *
shared_name *
shape: *
	container *
dtype0

counter/AssignAssigncountercounter/initial_value*
validate_shape(*
_class
loc:@counter*
use_locking(*
_output_shapes
: *
T0
^
counter/readIdentitycounter*
_class
loc:@counter*
_output_shapes
: *
T0
d
incr_counter_op/AssignAdd/valueConst*
_output_shapes
: *
valueB
 *  ?*
dtype0
 
incr_counter_op/AssignAdd	AssignAddcounterincr_counter_op/AssignAdd/value*
use_locking( *
_output_shapes
: *
T0*
_class
loc:@counter
J
deltaPlaceholder*
shape:*
dtype0*
_output_shapes
:

incr_counter_by_op/AssignAdd	AssignAddcounterdelta*
_output_shapes
: *
T0*
_class
loc:@counter*
use_locking( 
b
reset_counter_op/Assign/valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
¯
reset_counter_op/AssignAssigncounterreset_counter_op/Assign/value*
T0*
validate_shape(*
_class
loc:@counter*
use_locking( *
_output_shapes
: 

initNoOp^counter/Assign
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 

save/StringJoin/inputs_1Const*<
value3B1 B+_temp_7430d5c48930450181e28d18ac7dbf86/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
_output_shapes
: *
N*
	separator 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
w
save/SaveV2/tensor_namesConst"/device:CPU:0*
valueBBcounter*
dtype0*
_output_shapes
:
t
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
valueB
B *
dtype0

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicescounter"/device:CPU:0*
dtypes
2
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: *
T0
¬
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
_output_shapes
:*

axis *
N*
T0

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(

save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints"/device:CPU:0*
_output_shapes
: *
T0
k
save/RestoreV2/tensor_namesConst*
valueBBcounter*
dtype0*
_output_shapes
:
h
save/RestoreV2/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2*
_output_shapes
:

save/AssignAssigncountersave/RestoreV2*
_output_shapes
: *
T0*
validate_shape(*
_class
loc:@counter*
use_locking(
(
save/restore_shardNoOp^save/Assign
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"U
	variablesHF
D
	counter:0counter/Assigncounter/read:02counter/initial_value:0"_
trainable_variablesHF
D
	counter:0counter/Assigncounter/read:02counter/initial_value:0*F
get_counter7
output
	counter:0e tensorflow/serving/predict*y
incr_counter_byf

delta
delta:0.
output$
incr_counter_by_op/AssignAdd:0e tensorflow/serving/predict*Y
incr_counterI+
output!
incr_counter_op/AssignAdd:0e tensorflow/serving/predict*X
reset_counterG)
output
reset_counter_op/Assign:0e tensorflow/serving/predict