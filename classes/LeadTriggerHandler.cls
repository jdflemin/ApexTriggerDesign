/**
 * Created by Justin Fleming on 5/4/2019.
 */

public class LeadTriggerHandler extends VirtualTrigger{
	
	public LeadTriggerHandler(System.TriggerOperation triggerOperation) {
		super(triggerOperation);
		triggerNew = !triggerNew.isEmpty() ? (List<Lead>) triggerNew : new List<Lead>();
		triggerOld = !triggerOld.isEmpty() ? (List<Lead>) triggerOld : new List<Lead>();
		newMap = !newMap.isEmpty() ? (Map<Id, Lead>) newMap : new Map<Id, Lead>();
		oldMap = !oldMap.isEmpty() ? (Map<Id, Lead>) oldMap: new Map<Id, Lead>();
	}
	
	public override void beforeInsert() {
		// code to call domain and selector layer
	}
	
}