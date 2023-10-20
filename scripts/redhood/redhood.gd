extends CharacterBase

func _process(delta: float) -> void:
	match state:
		StateMachine.IDLE: _state_idle(delta)
		StateMachine.WALK: _state_walk(delta)
		StateMachine.JUMP: _state_jump(delta)
		StateMachine.FALL: _state_fall(delta)
		StateMachine.LANDING: _state_landing(delta)
		StateMachine.TRANSITION: _state_transition(delta)
		StateMachine.LATK1: _state_latk1(delta)
		StateMachine.LATK2: _state_latk2(delta)
		StateMachine.LATK3: _state_latk3(delta)
		StateMachine.HATK1: _state_hatk1(delta)
		StateMachine.HATK2: _state_hatk2(delta)
		StateMachine.HATK3: _state_hatk3(delta)
		
		
func _state_idle(delta: float) -> void:
	_set_animation("idle")	
	_apply_gravity(delta)
	_stop_movement()
	
	if direction:
		_enter_state(StateMachine.WALK)
	if Input.is_action_just_pressed("ui_up"):
		_enter_state(StateMachine.JUMP)
	if Input.is_action_just_pressed("ui_latk"):
		_enter_state(StateMachine.LATK1)
	if Input.is_action_just_pressed("ui_hatk"):
		_enter_state(StateMachine.HATK1)
		
func _state_walk(delta: float) -> void:
	_set_animation("walk")
	_apply_gravity(delta)
	_move_and_slide(delta)
	_set_flip()
	
	if not direction:
		_enter_state(StateMachine.IDLE)
	if Input.is_action_just_pressed("ui_up"):
		_enter_state(StateMachine.JUMP)
	if Input.is_action_just_pressed("ui_latk"):
		_enter_state(StateMachine.LATK1)
	if Input.is_action_just_pressed("ui_hatk"):
		_enter_state(StateMachine.HATK1)

func _state_jump(delta: float) -> void:
	_set_animation("jump")
	_apply_gravity(delta)
	_move_and_slide(delta)
	_set_flip()
	
	if enter_state:
		enter_state = false
		motion.y = -jump_force
		
	if motion.y > 0:
		_enter_state(StateMachine.TRANSITION)
		
func _state_transition(delta: float) -> void:		
	_set_animation("transition")
	_apply_gravity(delta)
	_move_and_slide(delta)
	_set_flip()
	
	if enter_state:
		enter_state=false
		yield(get_tree().create_timer(0.35), "timeout")
		_enter_state(StateMachine.FALL)
		
func _state_fall(delta: float) -> void:
	_set_animation("fall")
	_apply_gravity(delta)
	_move_and_slide(delta)
	_set_flip()
	
	if is_on_floor():
		_enter_state(StateMachine.LANDING)

func _state_landing(delta: float) -> void:
	_set_animation("landing")
	_apply_gravity(delta)
	_stop_movement()
	_set_flip()
	
	if enter_state:
		enter_state=false
		yield(get_tree().create_timer(0.3), "timeout")
		_enter_state(StateMachine.IDLE)
	
func _state_latk1(delta: float) -> void:	
	_set_animation("latk1")
	_stop_movement()	
	timer_attack.set_wait_time(0.48)
	
	if enter_state:
		enter_state=false
		timer_attack.start()
		
	if Input.is_action_just_pressed("ui_latk"):
		timer_attack.stop()
		_enter_state(StateMachine.LATK2)	
				
				
func _state_latk2(delta: float) -> void:	
	_set_animation("latk2")
	_stop_movement()
	timer_attack.set_wait_time(0.42)
	
	if enter_state:
		enter_state=false
		timer_attack.start()
	
	if Input.is_action_just_pressed("ui_latk"):
		timer_attack.stop()
		_enter_state(StateMachine.LATK3)		
	
func _state_latk3(delta: float) -> void:
	_set_animation("latk3")
	_stop_movement()
	timer_attack.set_wait_time(0.53)
		
	if enter_state:
		enter_state=false
		timer_attack.start()
	
func _state_hatk1(delta: float) -> void:	
	_set_animation("hatk1")
	_stop_movement()
	timer_attack.set_wait_time(0.6)
	
	if enter_state:
		enter_state=false
		timer_attack.start()
		
	if Input.is_action_just_pressed("ui_hatk"):
		timer_attack.stop()
		_enter_state(StateMachine.HATK2)
	
func _state_hatk2(delta: float) -> void:	
	_set_animation("hatk2")
	_stop_movement()
	timer_attack.set_wait_time(0.71)
	
	if enter_state:
		enter_state=false
		timer_attack.start()
		
	if Input.is_action_just_pressed("ui_hatk"):
		timer_attack.stop()
		_enter_state(StateMachine.HATK3)
	
func _state_hatk3(delta: float) -> void:
	_set_animation("hatk3")
	_stop_movement()
	timer_attack.set_wait_time(1.1)
		
	if enter_state:
		enter_state=false
		timer_attack.start()
		yield(get_tree().create_timer(0.7), "timeout")
		get_parent().get_node("Camera").shake(100)
		

func _on_TimerAttack_timeout():
	_enter_state(StateMachine.IDLE)	
	timer_attack.stop()
