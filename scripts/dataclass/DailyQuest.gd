extends Resource
class_name DailyQuest

@export var name: String = "Daily Task"  # 任务名称
@export var description: String = "Complete the task."  # 任务描述
@export var reward: Currency  # 奖励
@export var reward_amount: int = 1
@export var target: int = 1  # 任务目标进度

# 初始化属性
var is_completed: bool = false  # 是否完成
var progress: int = 0  # 当前进度

# 更新任务进度
func update_progress(value: int):
	if not is_completed:
		progress += value
		if progress >= target:
			progress = target
			complete_task()

# 完成任务
func complete_task():
	if not is_completed:
		is_completed = true
		print("任务完成: " + name)
		give_reward()

# 发放奖励
func give_reward():
	print("奖励已发放: " + str(reward_amount) + Currency.DISPLAY_NAME[reward.name])