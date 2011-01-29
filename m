From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33434] [nouveau nv84] BUG while reloading module
Date: Sat, 29 Jan 2011 14:31:11 -0800 (PST)
Message-ID: <20110129223111.5C13813004D@annarchy.freedesktop.org>
References: <bug-33434-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33434-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=33434

--- Comment #3 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-01-29 14:31:11 PST ---
looks like thats the culprit :

commit 3d58ec154bc87b206a3439f064e1c8aa6090c1ee
Author: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Date:   Thu Jan 6 20:29:53 2011 +0100

    drm/nouveau: fix hwmon device binding

    Bind the hwmon structs to nouveau device kobj. This makes sure
    the hwmon files are created in the device subdir in line with
    all other hwmon drivers.

    Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c
b/drivers/gpu/drm/nouveau/nouveau_pm.c
index d938141..fb846a3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
@@ -422,8 +422,7 @@ nouveau_hwmon_init(struct drm_device *dev)
                return ret;
        }
        dev_set_drvdata(hwmon_dev, dev);
-       ret = sysfs_create_group(&hwmon_dev->kobj,
-                                       &hwmon_attrgroup);
+       ret = sysfs_create_group(&dev->pdev->dev.kobj, &hwmon_attrgroup);
        if (ret) {
                NV_ERROR(dev,
                        "Unable to create hwmon sysfs file: %d\n", ret);

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
