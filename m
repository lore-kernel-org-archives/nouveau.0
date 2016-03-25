From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94694] [NVC1] Attempt to use kde/plasma renders the
 system immediately unresponsive
Date: Fri, 25 Mar 2016 13:29:52 +0000
Message-ID: <bug-94694-8800-h2eVr6DiLB@http.bugs.freedesktop.org/>
References: <bug-94694-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1344012918=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94694-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1344012918==
Content-Type: multipart/alternative; boundary="14589125920.AE97F0B9.16705";
 charset="UTF-8"


--14589125920.AE97F0B9.16705
Date: Fri, 25 Mar 2016 13:29:52 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94694

--- Comment #2 from Alexander Dubov <oakad-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
Some additional messages do appear:

Mar 25 23:40:44 mercador kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
Mar 25 23:40:46 mercador kernel: nouveau 0000:01:00.0: fifo: runlist update
time
out
Mar 25 23:40:46 mercador kernel: nouveau 0000:01:00.0: fifo: INTR 00000001:
0000
000b

During a different attempt:

Mar 25 18:19:03 mercador kernel: [ 3381.724766] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00040000 [] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd 2490 data
0000
00d0
Mar 25 18:19:03 mercador kernel: [ 3381.724779] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
0c data 80ff0e04
Mar 25 18:19:03 mercador kernel: [ 3381.724789] nouveau 0000:01:00.0: fifo:
PBDM
A0: 02000000 [] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd 0020 data
0000
8006
Mar 25 18:19:03 mercador kernel: [ 3381.724801] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
30 data 800103e4
Mar 25 18:19:03 mercador kernel: [ 3381.724812] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
34 data 20010680
Mar 25 18:19:03 mercador kernel: [ 3381.724822] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
38 data 00001111
.... more similar messages to follow ....

Also, there may have been other messages during other runs (because of a nasty
nature of a fault it's not always possible to capture them).

Also, it appears that only Plasma is affected: Gnome, Firefox (including WebGL
stuff), most KDE apps running stand alone appear to just work.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14589125920.AE97F0B9.16705
Date: Fri, 25 Mar 2016 13:29:52 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Attempt to use kde/plasma renders the system immediately unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94694#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] Attempt to use kde/plasma renders the system immediately unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94694">bug 94694</a>
              from <span class="vcard"><a class="email" href="mailto:oakad&#64;yahoo.com" title="Alexander Dubov &lt;oakad&#64;yahoo.com&gt;"> <span class="fn">Alexander Dubov</span></a>
</span></b>
        <pre>Some additional messages do appear:

Mar 25 23:40:44 mercador kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 0d []
Mar 25 23:40:46 mercador kernel: nouveau 0000:01:00.0: fifo: runlist update
time
out
Mar 25 23:40:46 mercador kernel: nouveau 0000:01:00.0: fifo: INTR 00000001:
0000
000b

During a different attempt:

Mar 25 18:19:03 mercador kernel: [ 3381.724766] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00040000 [] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd 2490 data
0000
00d0
Mar 25 18:19:03 mercador kernel: [ 3381.724779] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
0c data 80ff0e04
Mar 25 18:19:03 mercador kernel: [ 3381.724789] nouveau 0000:01:00.0: fifo:
PBDM
A0: 02000000 [] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd 0020 data
0000
8006
Mar 25 18:19:03 mercador kernel: [ 3381.724801] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
30 data 800103e4
Mar 25 18:19:03 mercador kernel: [ 3381.724812] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
34 data 20010680
Mar 25 18:19:03 mercador kernel: [ 3381.724822] nouveau 0000:01:00.0: fifo:
PBDM
A0: 00200000 [ILLEGAL_MTHD] ch 17 [003f4cc000 plasmashell[24734]] subc 0 mthd
00
38 data 00001111
.... more similar messages to follow ....

Also, there may have been other messages during other runs (because of a nasty
nature of a fault it's not always possible to capture them).

Also, it appears that only Plasma is affected: Gnome, Firefox (including WebGL
stuff), most KDE apps running stand alone appear to just work.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14589125920.AE97F0B9.16705--

--===============1344012918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1344012918==--
