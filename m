From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77674] [NVE7] "failed to read DPCD" on wake up with
 external monitor
Date: Fri, 20 Jun 2014 23:50:21 +0000
Message-ID: <bug-77674-8800-R321vLpWus@http.bugs.freedesktop.org/>
References: <bug-77674-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0276950128=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77674-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0276950128==
Content-Type: multipart/alternative; boundary="1403308220.a6eAff4.4323"; charset="us-ascii"


--1403308220.a6eAff4.4323
Date: Fri, 20 Jun 2014 23:50:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77674

--- Comment #3 from e.swanson+xorgbugs-5lA2vZBjcqn3oGB3hsPCZA@public.gmane.org ---
To add my two cents:

I had this same issue on Arch Linux's 3.14.5-1-ARCH, Linus's v3.15, and
linux-3.15.y from the linux-stable tree. imirkin's advice of trying out
drm-next (commit bc1dfff04a5d4064ba0db1fab13f84ab4f333d2b) seems to have fixed
it for me.

I'm using an active (USB powered) DisplayPort -> Dual Link DVI adapter to drive
a 27" 2560x1440 monitor from a Lenovo ThinkPad W530. I don't have a dock.

As another data point, drm-fixes from airlied's tree (commit
884d6147ba19640a40fb45efe64360cdf92cac27) built but did not boot for me - it
hung before starting anything on my root drive (initrd seems to have loaded
fine).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403308220.a6eAff4.4323
Date: Fri, 20 Jun 2014 23:50:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674">bug 77674</a>
              from <span class="vcard"><a class="email" href="mailto:e.swanson+xorgbugs&#64;alloscomp.com" title="e.swanson+xorgbugs&#64;alloscomp.com">e.swanson+xorgbugs&#64;alloscomp.com</a>
</span></b>
        <pre>To add my two cents:

I had this same issue on Arch Linux's 3.14.5-1-ARCH, Linus's v3.15, and
linux-3.15.y from the linux-stable tree. imirkin's advice of trying out
drm-next (commit bc1dfff04a5d4064ba0db1fab13f84ab4f333d2b) seems to have fixed
it for me.

I'm using an active (USB powered) DisplayPort -&gt; Dual Link DVI adapter to drive
a 27&quot; 2560x1440 monitor from a Lenovo ThinkPad W530. I don't have a dock.

As another data point, drm-fixes from airlied's tree (commit
884d6147ba19640a40fb45efe64360cdf92cac27) built but did not boot for me - it
hung before starting anything on my root drive (initrd seems to have loaded
fine).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403308220.a6eAff4.4323--

--===============0276950128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0276950128==--
