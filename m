From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76319] [NVE6] MMIO FAULT, black screen on QHD+ K2100M
Date: Tue, 18 Mar 2014 14:40:57 +0000
Message-ID: <bug-76319-8800-clMMCHeIHh@http.bugs.freedesktop.org/>
References: <bug-76319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835213367=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0835213367==
Content-Type: multipart/alternative; boundary="1395153657.a2E5D4C2.17999"; charset="us-ascii"


--1395153657.a2E5D4C2.17999
Date: Tue, 18 Mar 2014 14:40:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76319

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think you may be the proud owner of multiple issues, as evidenced by the gpu
lockup you get down the line.

First off, there's no way that load had those nouveau.debug settings. You would
have seen a LOT more messages. I'm guessing you looked at some log file, and
that log file ignores debug-level messages. Try checking in dmesg directly.

Secondly, I'm pretty sure there's no way to achieve those resolutions without
the 540MHz clock frequency provided for by DP1.2 (at least not with 24bit
color). In core/engine/disp/dport.c:nouveau_dp_train, prepend a 540000 value in
the first position of the bw_list array.

Try to get a full debug log (which should include the various DP debug
messages, as well as others), with that change, and the nouveau.debug settings
you were already using (but apparently were either not being picked up, or
something else).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395153657.a2E5D4C2.17999
Date: Tue, 18 Mar 2014 14:40:57 +0000
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
   title="NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76319#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] MMIO FAULT, black screen on QHD+ K2100M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76319">bug 76319</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think you may be the proud owner of multiple issues, as evidenced by the gpu
lockup you get down the line.

First off, there's no way that load had those nouveau.debug settings. You would
have seen a LOT more messages. I'm guessing you looked at some log file, and
that log file ignores debug-level messages. Try checking in dmesg directly.

Secondly, I'm pretty sure there's no way to achieve those resolutions without
the 540MHz clock frequency provided for by DP1.2 (at least not with 24bit
color). In core/engine/disp/dport.c:nouveau_dp_train, prepend a 540000 value in
the first position of the bw_list array.

Try to get a full debug log (which should include the various DP debug
messages, as well as others), with that change, and the nouveau.debug settings
you were already using (but apparently were either not being picked up, or
something else).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395153657.a2E5D4C2.17999--

--===============0835213367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0835213367==--
