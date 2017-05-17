package  ${packageName};

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;



import java.util.ArrayList;
import java.util.List;



/**
 * 指导页面
 */

public class ${activityClass} extends AppCompatActivity
{
    private ViewPager viewPager;
    // 底部小点图片
    private ImageView[] dots;
    // 记录当前选中位置
    private int currentIndex;
    //引导图片
    private List<View> images;
    /**
     * 判断是否第一次运行程序
     */
    private ViewPagerAdapter vpAdapter;
    private ViewPager vp;
	
	private int mTabCount = ${tabCount};

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
      // 隐藏状态栏
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
       setContentView(R.layout.${activityLayoutName});
        // 初始化页面
        initViews();
        // 初始化底部小点
        initDots();
    }
	
	private void initViews() {
        LayoutInflater inflater = LayoutInflater.from(this);

        images = new ArrayList<>();
        // 初始化引导图片列表
		for(int i = 0 ; i < mTabCount; i++){
			 images.add(inflater.inflate(R.layout.view1, null));
		}      

        // 初始化Adapter
        vpAdapter = new ViewPagerAdapter(images, this);

        vp = (ViewPager) findViewById(R.id.viewpager);
        vp.setAdapter(vpAdapter);
        // 绑定回调
        vp.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            // 当当前页面被滑动时调用
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }
            // 当新的页面被选中时调用
            @Override
            public void onPageSelected(int position) {
                // 设置底部小点选中状态
                setCurrentDot(position);
            }
            // 当滑动状态改变时调用
            @Override
            public void onPageScrollStateChanged(int state) {

            }
        });
    }
	
	
	 /***
     * 当前选中图片时刷新小圆点
     */
    private void initDots() {
        LinearLayout ll = (LinearLayout) findViewById(R.id.ll);

        dots = new ImageView[images.size()];

        // 循环取得小点图片
        for (int i = 0; i < images.size(); i++) {
            dots[i] = (ImageView) ll.getChildAt(i);
            dots[i].setEnabled(true);// 都设为灰色
        }

        currentIndex = 0;
        dots[currentIndex].setEnabled(false);// 设置为白色，即选中状态
    }
	
	 private void setCurrentDot(int position) {
        if (position < 0 || position > images.size() - 1
                || currentIndex == position) {
            return;
        }
        dots[position].setEnabled(false);
        dots[currentIndex].setEnabled(true);
        currentIndex = position;
    }
	
	
	 public class ViewPagerAdapter extends PagerAdapter{

        // 图片列表
        private List<View> images;
        private Activity activity;
        private static final String SHAREDPREFERENCES_NAME = "first_pref";
         ViewPagerAdapter(List<View> views, Activity activity) {
            this.images = views;
            this.activity = activity;
        }

        @Override
        public int getCount() {
            if(images!=null){
            return images.size();
            }
            return 0;
        }

        @Override
        public boolean isViewFromObject(View view, Object object) {
            return object== view;
        }

        @Override
        public Object instantiateItem(ViewGroup container, int position) {
            ((ViewPager)container).addView(images.get(position),0);
            if (position == images.size() - 1) {
            }
            return images.get(position);

        }

        private void goHome() {
            // 跳转
            Intent intent = new Intent(activity, MainActivity.class);
            activity.startActivity(intent);
            activity.finish();
        }

        /**
         * method desc：设置已经引导过了，下次启动不用再次引导
         */
        private void setGuided() {
            SharedPreferences preferences = ${activityClass}.this.getSharedPreferences(
                    SHAREDPREFERENCES_NAME, Context.MODE_PRIVATE);
            SharedPreferences.Editor editor = preferences.edit();
            // 存入数据
            editor.putBoolean(getString(R.string.isFirstIn), false);
//			editor.putBoolean("isFirstIn", true);
            // 提交修改
            editor.commit();
        }

        /**这个方法，是从ViewGroup中移出当前View**/
        public void destroyItem(View container,int position,Object object){

            ((ViewGroup) container).removeView((View) object);

            object=null;

        }


    }

	
	
	
	
}
