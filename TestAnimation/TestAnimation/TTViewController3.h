//
//  TTViewController3.h
//  TestAnimation
//
//  Created by love on 2017/6/28.
//  Copyright © 2017年 love. All rights reserved.
//

#import <UIKit/UIKit.h>

struct v_animal_ptr {
    // 获取名字
    const char * (* get_name)();
    // 喊叫
    void (*shout)(int volume);
};

typedef struct v_animal_ptr animal_vptr;

typedef const char* (*GET_NAME)();
typedef void (*SHOUT)(int volume);

// 定义一个动画类
struct animal {
    animal_vptr *vptr;
};

static const char * animal_get_name(const void *class) {
    return ((struct animal*)class)->vptr->get_name();
}

static void animal_shout(const void *class,int volume) {
    return ((struct animal *)class)->vptr->shout(volume);
}

// 定义一个猪类，有一个高度值
struct pig {
    animal_vptr *vptr;
    int height;
};

static const char * pig_get_name() {
    return "i am pig";
};

static void pig_shout(int volume) {
    printf("heng heng %d\n",volume);
}

// 定义猪的实现方法
static animal_vptr pig_vptr = {
    (GET_NAME) &pig_get_name,
    (SHOUT) &pig_shout,
};


// 定义一个狗类，有一个颜色值
struct dog {
    animal_vptr *vptr;
    int color;
};

static const char * dog_get_name() {
    return "i am dog";
}

static void dog_shout(int volume) {
    printf("wang wang %d\n",volume);
}

static animal_vptr dog_vptr = {
    (GET_NAME) &dog_get_name,
    (SHOUT) &dog_shout,
};

static struct pig* init_pig() {
    struct pig * anim = (struct pig *) malloc(sizeof(struct pig));
    anim->vptr = &pig_vptr;
    anim->height = 10;
    return anim;
}

static struct dog* init_dog() {
    struct dog* anim = (struct dog *) malloc(sizeof(struct dog));
    anim->vptr = &dog_vptr;
    anim->color = 20;
    return anim;
}



//static struct v_animal_ptr *init_animal() {
//    struct v_animal_ptr * animal = (struct v_animal_ptr *) malloc(sizeof(struct v_animal_ptr));
//    animal->get_name = &
//}






@interface TTViewController3 : UIViewController

@end





