/**
 * Created by Justin Fleming on 5/4/2019.
 */

public abstract class AbstractTrigger {

	public List<SObject> triggerNew;
	public List<SObject> triggerOld;
	public Map<Id, SObject> newMap;
	public Map<Id, SObject> oldMap;
	
	public AbstractTrigger(System.TriggerOperation triggerOperation) {
		this.setContextVariables(triggerOperation);
	}
	
	public abstract void beforeInsert();
	public abstract void beforeUpdate();
	public abstract void beforeDelete();
	
	public abstract void afterInsert();
	public abstract void afterUpdate();
	public abstract void afterDelete();
	public abstract void afterUndelete();
	
	private void setContextVariables(System.TriggerOperation triggerOperation){
		switch on triggerOperation {
			when BEFORE_INSERT {
				this.triggerNew = Trigger.new;
			}
			when AFTER_INSERT, AFTER_UNDELETE {
				this.triggerNew = Trigger.new;
				this.newMap = Trigger.newMap;
			}
			when BEFORE_DELETE, AFTER_DELETE {
				this.triggerOld = Trigger.old;
				this.oldMap = Trigger.oldMap;
			}
			when BEFORE_UPDATE, AFTER_UPDATE {
				this.triggerNew = Trigger.new;
				this.triggerOld = Trigger.old;
				this.newMap = Trigger.newMap;
				this.oldMap = Trigger.oldMap;
			}
			when else {
				System.debug('Error');
			}
		}
	}
}