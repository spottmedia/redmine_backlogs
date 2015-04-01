class RbEpic < RbStory
  unloadable

  private

  #where to load tracker list from
  def self.tracker_setting; :epic_trackers end

  public

  scope :epics, lambda { 
    where('tracker_id in (?)', RbEpic.trackers)
  }

  def stories
    return self.children
  end

  #disable some story methods
  def tasks; nil end
  def story_follow_task_state; nil end

end
