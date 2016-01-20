From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Wed, 20 Jan 2016 19:14:57 +0000
Message-ID: <bug-93629-8800-8gHqnPAp9I@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1549430673=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1549430673==
Content-Type: multipart/alternative; boundary="14533172973.C41b67Db4.9447";
 charset="UTF-8"


--14533172973.C41b67Db4.9447
Date: Wed, 20 Jan 2016 19:14:57 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93629

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
                   |                            |skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The driver's expectations of firmware were changed in

commit 8539b37acef73949861a16808b60cb8b5b9b3bab
Author: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Tue Jun 23 15:16:01 2015 +0900

    drm/nouveau/gr: use NVIDIA-provided external firmwares

    NVIDIA will officially start providing GR firmwares through
    linux-firmware for GPUs that require it. Change the GR firmware lookup
    function to use these files.

    Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

fuc409c -> fecs_inst
fuc409d -> fecs_data
fuc41ac -> gpccs_inst
fuc41ad -> gpccs_data

And it wants the files to live in nvidia/gk106/ (or whatever the relevant chip
name).

Ben's belief is that everyone should be fine with nouveau firmware, and the
fact that the nvidia firmware works at all with nouveau is a fluke.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14533172973.C41b67Db4.9447
Date: Wed, 20 Jan 2016 19:14:57 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
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
           <td>gnurou&#64;gmail.com, skeggsb&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] complete system freeze, PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93629">bug 93629</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The driver's expectations of firmware were changed in

commit 8539b37acef73949861a16808b60cb8b5b9b3bab
Author: Alexandre Courbot &lt;<a href="mailto:acourbot&#64;nvidia.com">acourbot&#64;nvidia.com</a>&gt;
Date:   Tue Jun 23 15:16:01 2015 +0900

    drm/nouveau/gr: use NVIDIA-provided external firmwares

    NVIDIA will officially start providing GR firmwares through
    linux-firmware for GPUs that require it. Change the GR firmware lookup
    function to use these files.

    Signed-off-by: Alexandre Courbot &lt;<a href="mailto:acourbot&#64;nvidia.com">acourbot&#64;nvidia.com</a>&gt;
    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

fuc409c -&gt; fecs_inst
fuc409d -&gt; fecs_data
fuc41ac -&gt; gpccs_inst
fuc41ad -&gt; gpccs_data

And it wants the files to live in nvidia/gk106/ (or whatever the relevant chip
name).

Ben's belief is that everyone should be fine with nouveau firmware, and the
fact that the nvidia firmware works at all with nouveau is a fluke.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14533172973.C41b67Db4.9447--

--===============1549430673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1549430673==--
