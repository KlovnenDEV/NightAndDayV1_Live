Config = {
    -- Required job to open the tablet
    Permission = 'ambulance',

    Notifications = {
        -- Citizens
        CallSubmitted = 'EMS has received your call',
        ReceivedRespond = '911:',
        -- EMS
        NewCall = 'A new call as been created at',
        AttachedCall = 'You are attached to the selected call',
        DetachCall = 'You are no longer attached to the call',
        DeleteCall = 'You deleted the call with incident id: #',
        RespondedCall = 'The citizen in need received your call on #',
        NoTarget = 'Target not online',
        NoMessage = 'You did not enter any message',
        NewCase = 'You submitted a new case to the database',
        DeletedCase = 'You deleted case #',
        SavedCase = 'You saved case #',

        -- Developer / Administrator
        UserNotFound = 'Your identifier was not found in the database, contact the servers developer or administrator!',
    }
}
