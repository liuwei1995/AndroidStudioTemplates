package ${packageName};

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.CallSuper;
import android${SupportPackage}.app.Fragment;
import android.view.View;

import ${packageName}.presenter.${presenterName};


<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>


/**
 * Created by liuwei on 2017/3/21
 * <li>要实现延迟加载Fragment内容,需要在 onCreateView
 * isPrepared = true;</li>
 */

public abstract class ${fragmentClass}<E extends ${presenterName}> extends Fragment implements View.OnClickListener{

    private static final String TAG = ${fragmentClass}.class.getSimpleName();

    public boolean isPause = false;


    public boolean isVisible = true;
    /**
     * 是否第一次加载
     */
    public boolean isFirstLoad = true;
    /**
     * 标志位，View已经初始化完成。
     * 2016/04/29
     * 用isAdded()属性代替
     * 2016/05/03
     * isPrepared还是准一些,isAdded有可能出现onCreateView没走完但是isAdded了
     */
    public boolean isPrepared;

    protected E mPresenter;

    abstract E getmPresenter();

    /**
     * 查找view的空间id
     * @param view
     * @param viewID
     * @param <T>
     * @return
     */
    public <T extends View> T $(View view,int viewID) {
        return (T) view.findViewById(viewID);
    }

    public <T extends View> T $(int viewID) {
        View view = getView();
        if(view != null)  return $(view,viewID);
        return null;
    }

    public void setOnClickListener(View ...views){
        if(views != null)
        for (int i = 0; i < views.length; i++) {
            views[i].setOnClickListener(this);
        }
    }
    @Override
    public void onResume() {
        super.onResume();
        isPause = false;
        if (mPresenter != null)
            mPresenter.onResume();
    }

    @Override
    public void onPause() {
        super.onPause();
        isPause = true;
        if (mPresenter != null)
            mPresenter.onPause();
    }


    /**
     * 如果是与ViewPager一起使用，调用的是setUserVisibleHint
     *
     * @param isVisibleToUser 是否显示出来了
     */
    @Override
    @CallSuper
    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        if (getUserVisibleHint()) {
            isVisible = true;
            onVisible();
        } else {
            isVisible = false;
            onInvisible();
        }
    }

    /**
     * 如果是通过FragmentTransaction的show和hide的方法来控制显示，调用的是onHiddenChanged.
     * 若是初始就show的Fragment 为了触发该事件 需要先hide再show
     *
     * @param hidden hidden True if the fragment is now hidden, false if it is not
     *               visible.
     */
    @Override
    @CallSuper
    public void onHiddenChanged(boolean hidden) {
        super.onHiddenChanged(hidden);
        if (!hidden) {
            isVisible = true;
            onVisible();
        } else {
            isVisible = false;
            onInvisible();
        }
    }
    /**
     * 显示的时候调用
     */
    @CallSuper
    protected void onVisible() {
        if (!isPrepared || !isVisible || !isFirstLoad) {
            //if (!isAdded() || !isVisible || !isFirstLoad) {
            return;
        }
        isFirstLoad = false;
        initData();
    }

    /**
     * 隐藏的时候调用
     */
    protected void onInvisible() {

    }

    @Override
    @CallSuper
    public void onAttach(Context context) {
        super.onAttach(context);
        mPresenter = getmPresenter();
        if (getArguments() != null) {
            Bundle arguments = getArguments();
            isPrepared = arguments.getBoolean("isPrepared", false);
        }
    }

    /**
     * 要实现延迟加载Fragment内容,需要在 onCreateView
     * isPrepared = true;
     */

    protected void initData() {
    }

    @Override
    public void onClick(View v) {

    }
}
