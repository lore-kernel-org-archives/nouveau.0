From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28095] X crash with PFIFO_CACHE_ERROR. (Nouveau on
	Riva TNT).
Date: Tue, 17 Feb 2015 18:43:35 +0000
Message-ID: <bug-28095-8800-Qqwhnu9Emn@http.bugs.freedesktop.org/>
References: <bug-28095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1126321052=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1126321052==
Content-Type: multipart/alternative; boundary="1424198615.cbEe26131.32354"; charset="UTF-8"


--1424198615.cbEe26131.32354
Date: Tue, 17 Feb 2015 18:43:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=28095

--- Comment #15 from Brent <bzipitidoo-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
Yes, someone else said that hardware was unusual.  But Nouveau did work with
it, at elast somewhat, in the later 2.6 kernels.  If it helps at all, the
Diamond Viper V550 video card reports a version of 1.93E during POST.

Tried older versions of Puppy Linux, and ran into other problems.  First, the
older Puppy tried to load the saved configuration files from the newer Puppy. 
Once I stopped that, I got this.  In Xorg.0.log, 5.3.3 Slacko Puppy says:

failed to load kernel module "nouveau"

Puppy falls back to the vesa driver, which, while very slow, does work, and at
1280x1024.

If I do "modprobe nouveau" I get 7 error messages of the form "WARNING: Error
inserting xxx (/lib/modules/3.1.10-slacko_4gA/kernel/drivers/.." where xxx is:

button
wmi
agpgart
drm
ttm
drm_kms_helper
nouveau

Tried the debug boot parameters you suggested, with Slacko Puppy and Tahr Puppy
but they had no effect.  There is no debug subdirectory in /proc/sys/kernel. 
No doubt the stock Puppy kernel does not have debugging included.  Suppose I'll
have to build my own kernel to get that, which means a good bit of work.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424198615.cbEe26131.32354
Date: Tue, 17 Feb 2015 18:43:35 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - X crash with PFIFO_CACHE_ERROR. (Nouveau on Riva TNT)."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=28095">bug 28095</a>
              from <span class="vcard"><a class="email" href="mailto:bzipitidoo&#64;hotmail.com" title="Brent &lt;bzipitidoo&#64;hotmail.com&gt;"> <span class="fn">Brent</span></a>
</span></b>
        <pre>Yes, someone else said that hardware was unusual.  But Nouveau did work with
it, at elast somewhat, in the later 2.6 kernels.  If it helps at all, the
Diamond Viper V550 video card reports a version of 1.93E during POST.

Tried older versions of Puppy Linux, and ran into other problems.  First, the
older Puppy tried to load the saved configuration files from the newer Puppy. 
Once I stopped that, I got this.  In Xorg.0.log, 5.3.3 Slacko Puppy says:

failed to load kernel module &quot;nouveau&quot;

Puppy falls back to the vesa driver, which, while very slow, does work, and at
1280x1024.

If I do &quot;modprobe nouveau&quot; I get 7 error messages of the form &quot;WARNING: Error
inserting xxx (/lib/modules/3.1.10-slacko_4gA/kernel/drivers/..&quot; where xxx is:

button
wmi
agpgart
drm
ttm
drm_kms_helper
nouveau

Tried the debug boot parameters you suggested, with Slacko Puppy and Tahr Puppy
but they had no effect.  There is no debug subdirectory in /proc/sys/kernel. 
No doubt the stock Puppy kernel does not have debugging included.  Suppose I'll
have to build my own kernel to get that, which means a good bit of work.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424198615.cbEe26131.32354--

--===============1126321052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1126321052==--
