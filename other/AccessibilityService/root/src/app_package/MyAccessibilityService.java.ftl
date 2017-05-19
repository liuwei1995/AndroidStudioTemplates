package ${packageName};

import android.accessibilityservice.AccessibilityService;
import android.view.accessibility.AccessibilityEvent;

/**
 * Created by liuwei on 2017/5/19 15:10
 */

public class ${className} extends AccessibilityService{

    private static final String TAG = ${className}.class.getSimpleName();

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {

    }

    @Override
    public void onInterrupt() {

    }

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
    }
}
