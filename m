From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] xf86-video-nouveau fails to modprobe nouveau:
 KMS not enabled
Date: Mon, 18 Feb 2013 21:28:50 +0000
Message-ID: <bug-60772-8800-N4DGOak8sr@http.bugs.freedesktop.org/>
References: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0813564254=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0813564254==
Content-Type: multipart/alternative; boundary="1361222930.BAd5f8281.9792"; charset="us-ascii"


--1361222930.BAd5f8281.9792
Date: Mon, 18 Feb 2013 21:28:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

--- Comment #6 from Honza <hkmaly-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org> ---
Should I post this bug on http://www.explainxkcd.com/wiki/index.php?title=1172
:-) ?

I repeat: there is NO mode switch in my workflow before starting X, therefore
no need for KMS. Power saving is also not needed, as I'm starting the X in five
minutes, usually faster.

Also, remembered another advantage of this setup. I could decide to start the
proprietary nvidia driver instead of nouveau. (If it's still possible to
compile it against current kernel, I must admit I didn't checked lately.)

I don't have nouveau blacklisted, that's easy enough to check :-). In fact, I
don't have it mentioned in module configuration at all, meaning kernel shows
great amount of intelligence by finding it. I think following lines from
/var/log/hotplug relates:

Mon Feb 18 09:59:22 CET 2013: module add /module/cfbfillrect
Mon Feb 18 09:59:22 CET 2013: module add /module/cfbimgblt
Mon Feb 18 09:59:22 CET 2013: module add /module/video
Mon Feb 18 09:59:22 CET 2013: drivers add /bus/acpi/drivers/video
Mon Feb 18 09:59:22 CET 2013: module add /module/wmi
Mon Feb 18 09:59:22 CET 2013: drivers add /bus/acpi/drivers/wmi
Mon Feb 18 09:59:22 CET 2013: class add /class/wmi
Mon Feb 18 09:59:22 CET 2013: module add /module/mxm_wmi
Mon Feb 18 09:59:22 CET 2013: module add /module/cfbcopyarea
Mon Feb 18 09:59:22 CET 2013: module add /module/drm_kms_helper
Mon Feb 18 09:59:22 CET 2013: module add /module/ttm
Mon Feb 18 09:59:22 CET 2013: drm add /devices/virtual/drm/ttm
Mon Feb 18 09:59:23 CET 2013: module add /module/nouveau

Also, apparently I'm using http://linux-hotplug.sourceforge.net ... not sure
about udev. I have it installed, but no daemon is running. Still, before you
changed the xf86-video-nouveau, I had no problems.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361222930.BAd5f8281.9792
Date: Mon, 18 Feb 2013 21:28:50 +0000
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
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">bug 60772</a>
              from <span class="vcard"><a class="email" href="mailto:hkmaly&#64;bigfoot.com" title="Honza &lt;hkmaly&#64;bigfoot.com&gt;"> <span class="fn">Honza</span></a>
</span></b>
        <pre>Should I post this bug on <a href="http://www.explainxkcd.com/wiki/index.php?title=1172">http://www.explainxkcd.com/wiki/index.php?title=1172</a>
:-) ?

I repeat: there is NO mode switch in my workflow before starting X, therefore
no need for KMS. Power saving is also not needed, as I'm starting the X in five
minutes, usually faster.

Also, remembered another advantage of this setup. I could decide to start the
proprietary nvidia driver instead of nouveau. (If it's still possible to
compile it against current kernel, I must admit I didn't checked lately.)

I don't have nouveau blacklisted, that's easy enough to check :-). In fact, I
don't have it mentioned in module configuration at all, meaning kernel shows
great amount of intelligence by finding it. I think following lines from
/var/log/hotplug relates:

Mon Feb 18 09:59:22 CET 2013: module add /module/cfbfillrect
Mon Feb 18 09:59:22 CET 2013: module add /module/cfbimgblt
Mon Feb 18 09:59:22 CET 2013: module add /module/video
Mon Feb 18 09:59:22 CET 2013: drivers add /bus/acpi/drivers/video
Mon Feb 18 09:59:22 CET 2013: module add /module/wmi
Mon Feb 18 09:59:22 CET 2013: drivers add /bus/acpi/drivers/wmi
Mon Feb 18 09:59:22 CET 2013: class add /class/wmi
Mon Feb 18 09:59:22 CET 2013: module add /module/mxm_wmi
Mon Feb 18 09:59:22 CET 2013: module add /module/cfbcopyarea
Mon Feb 18 09:59:22 CET 2013: module add /module/drm_kms_helper
Mon Feb 18 09:59:22 CET 2013: module add /module/ttm
Mon Feb 18 09:59:22 CET 2013: drm add /devices/virtual/drm/ttm
Mon Feb 18 09:59:23 CET 2013: module add /module/nouveau

Also, apparently I'm using <a href="http://linux-hotplug.sourceforge.net">http://linux-hotplug.sourceforge.net</a> ... not sure
about udev. I have it installed, but no daemon is running. Still, before you
changed the xf86-video-nouveau, I had no problems.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361222930.BAd5f8281.9792--

--===============0813564254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0813564254==--
