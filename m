From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Wed, 20 Apr 2016 18:34:27 +0000
Message-ID: <bug-59069-8800-WUskk5H0Kw@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1596133428=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1596133428==
Content-Type: multipart/alternative; boundary="14611772674.8aCddEb.32477";
 charset="UTF-8"


--14611772674.8aCddEb.32477
Date: Wed, 20 Apr 2016 18:34:27 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=59069

Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |freedesktop-wf/ZkUcLzLDOr/ThvNiZoQ@public.gmane.org
                   |                            |me

--- Comment #35 from Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> ---
I too am seeing sporadic "fail ttm_validate" messages, though mine say
"validating bo list" (as in Comment 32) rather than "validate vram_list" (as in
Comment 0 et al).

[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kscreenlocker_g[15847]: fail
ttm_validate
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kscreenlocker_g[15847]:
validating bo list
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kscreenlocker_g[15847]:
validate: -12
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kwin_x11[2268]: fail
ttm_validate
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kwin_x11[2268]: validating bo
list
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kwin_x11[2268]: validate: -12


01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd G84 [GeForce 8600 GT]
        Flags: bus master, fast devsel, latency 0, IRQ 27
        Memory at e4000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at e2000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at 3000 [size=128]
        Expansion ROM at <ignored> [disabled]
        Capabilities: <access denied>
        Kernel driver in use: nouveau

Linux version 4.5.1-gentoo (root@Crushinator) (gcc version 5.3.0 (Gentoo 5.3.0
p1.0, pie-0.6.5) ) #3 SMP Wed Apr 20 10:39:09 EDT 2016

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14611772674.8aCddEb.32477
Date: Wed, 20 Apr 2016 18:34:27 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:freedesktop&#64;mattwhitlock.name" title="Matt Whitlock &lt;freedesktop&#64;mattwhitlock.name&gt;"> <span class="fn">Matt Whitlock</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>freedesktop&#64;mattwhitlock.name
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;mattwhitlock.name" title="Matt Whitlock &lt;freedesktop&#64;mattwhitlock.name&gt;"> <span class="fn">Matt Whitlock</span></a>
</span></b>
        <pre>I too am seeing sporadic &quot;fail ttm_validate&quot; messages, though mine say
&quot;validating bo list&quot; (as in <a href="show_bug.cgi?id=59069#c32">Comment 32</a>) rather than &quot;validate vram_list&quot; (as in
<a href="show_bug.cgi?id=59069#c0">Comment 0</a> et al).

[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kscreenlocker_g[15847]: fail
ttm_validate
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kscreenlocker_g[15847]:
validating bo list
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kscreenlocker_g[15847]:
validate: -12
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kwin_x11[2268]: fail
ttm_validate
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kwin_x11[2268]: validating bo
list
[Wed Apr 20 13:39:58 2016] nouveau 0000:01:00.0: kwin_x11[2268]: validate: -12


01:00.0 VGA compatible controller: NVIDIA Corporation G84 [GeForce 8600 GT]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd G84 [GeForce 8600 GT]
        Flags: bus master, fast devsel, latency 0, IRQ 27
        Memory at e4000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Memory at e2000000 (64-bit, non-prefetchable) [size=32M]
        I/O ports at 3000 [size=128]
        Expansion ROM at &lt;ignored&gt; [disabled]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau

Linux version 4.5.1-gentoo (root&#64;Crushinator) (gcc version 5.3.0 (Gentoo 5.3.0
p1.0, pie-0.6.5) ) #3 SMP Wed Apr 20 10:39:09 EDT 2016</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14611772674.8aCddEb.32477--

--===============1596133428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1596133428==--
