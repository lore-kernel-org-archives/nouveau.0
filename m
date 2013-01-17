From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Thu, 17 Jan 2013 07:16:18 +0000
Message-ID: <bug-59069-8800-v2CGaa4B7i@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0972012551=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0972012551==
Content-Type: multipart/alternative; boundary="1358406979.Dbb18EAA3.15213"; charset="us-ascii"


--1358406979.Dbb18EAA3.15213
Date: Thu, 17 Jan 2013 07:16:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #20 from Kees Bakker <kees.bakker-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> ---
Created attachment 73179
  --> https://bugs.freedesktop.org/attachment.cgi?id=73179&action=edit
dmesg with loggingv2 patch applied

Here is the dmesg from another system, with the same (G73, NV40) video adapter,
with two smaller monitors (1240x1024).

Notice that there are a lot of CACHE ERROR message. So many that the printk
buffer overflowed.

[70448.465702] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 3 mthd 0x0184 data 0xbeef0201
[70448.465725] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 3 mthd 0x0188 data 0xbeef0201
[70448.465745] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 3 mthd 0x0300 data 0x0000000b
...
[70448.475032] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 7 mthd 0x1dac data 0x00000000
[70448.475053] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 7 mthd 0x1dac data 0x00000000
[70448.475072] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 7 mthd 0x1dac data 0x00000000


BTW The user of this system is not doing much with it, so the logging is
preliminary. I'm waiting for more details to show up. In the mean time, this is
what we get after the first login.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358406979.Dbb18EAA3.15213
Date: Thu, 17 Jan 2013 07:16:19 +0000
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
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:kees.bakker&#64;xs4all.nl" title="Kees Bakker &lt;kees.bakker&#64;xs4all.nl&gt;"> <span class="fn">Kees Bakker</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=73179" name="attach_73179" title="dmesg with loggingv2 patch applied">attachment 73179</a> <a href="attachment.cgi?id=73179&amp;action=edit" title="dmesg with loggingv2 patch applied">[details]</a></span>
dmesg with loggingv2 patch applied

Here is the dmesg from another system, with the same (G73, NV40) video adapter,
with two smaller monitors (1240x1024).

Notice that there are a lot of CACHE ERROR message. So many that the printk
buffer overflowed.

[70448.465702] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 3 mthd 0x0184 data 0xbeef0201
[70448.465725] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 3 mthd 0x0188 data 0xbeef0201
[70448.465745] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 3 mthd 0x0300 data 0x0000000b
...
[70448.475032] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 7 mthd 0x1dac data 0x00000000
[70448.475053] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 7 mthd 0x1dac data 0x00000000
[70448.475072] nouveau E[   PFIFO][0000:01:00.0] CACHE_ERROR - ch 4
[unity_support_t[30391]] subc 7 mthd 0x1dac data 0x00000000


BTW The user of this system is not doing much with it, so the logging is
preliminary. I'm waiting for more details to show up. In the mean time, this is
what we get after the first login.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358406979.Dbb18EAA3.15213--

--===============0972012551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0972012551==--
