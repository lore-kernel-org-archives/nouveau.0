From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51157] GeForce GT 540M not working anymore
Date: Sun, 01 Jul 2012 13:06:20 +0000
Message-ID: <bug-51157-8800-ApEkRC8jGo@http.bugs.freedesktop.org/>
References: <bug-51157-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51157-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51157

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-07-01 06:06:20 PDT ---
Hi Diego

The errors in your logs could be related to the optimus solution on your laptop
- i.e. no displays physically connected to the nvidia card, thus causing Evo
issues. Have you tried booting in headless mode - "nouveau.modeset=2" in your
kernel command line ?

Due to further changes in nouveau, we refuse to load due to -EBUSY (nouveau:
probe of 0000:01:00.0 failed with error -16)
Would you mind narrowing down the issue - which kernel introduced it, can you
bisect


Ben

In the latter kernel 3.4(3.3 is affected as well) we fail to load, leaving one
of the following to blame

---
    ret = nouveau_fence_init(dev);
    if (ret)
        goto out_pm;

    if (dev_priv->eng[NVOBJ_ENGINE_GR]) {
        ret = nouveau_card_channel_init(dev);
        if (ret)
            goto out_fence;
    }

    if (dev->mode_config.num_crtc) {
        ret = nouveau_display_init(dev);
        if (ret)
            goto out_chan;

        nouveau_fbcon_init(dev);
    }

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
