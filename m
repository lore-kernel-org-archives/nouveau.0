From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Tue, 02 Sep 2014 16:55:42 +0000
Message-ID: <bug-82835-8800-Owhg4axn66@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1114984717=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1114984717==
Content-Type: multipart/alternative; boundary="1409676942.2D460D0C2.2011"; charset="us-ascii"


--1409676942.2D460D0C2.2011
Date: Tue, 2 Sep 2014 16:55:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hm, just noticed this (same as last time, but I guess I wasn't paying enough
attention):

nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[1645]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
nouveau E[     PFB][0000:05:00.0] trapped write at 0x00204050c0 on channel
0x000178fb [mplayer[1645]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT

method 1b0c == QUERY_GET. However the data is 0x1000f010, not 0xf010, which
means it's not coming from the video stuff or the screen fence stuff, but
rather is a PIPE_QUERY_GPU_FINISHED query. Which is interesting, because
nothing appears to actually use that PIPE_QUERY type...

Could you stick a assert(0) right before

      nv50_query_get(push, q, 0, 0x1000f010);

in nv50_query.c and see if it triggers (make sure to use a debug build... or
make it something nastier than assert), and get a backtrace from gdb? (Or
actually just set a breakpoint on that line and see if gdb hits it...)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409676942.2D460D0C2.2011
Date: Tue, 2 Sep 2014 16:55:42 +0000
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
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hm, just noticed this (same as last time, but I guess I wasn't paying enough
attention):

nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[1645]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
nouveau E[     PFB][0000:05:00.0] trapped write at 0x00204050c0 on channel
0x000178fb [mplayer[1645]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT

method 1b0c == QUERY_GET. However the data is 0x1000f010, not 0xf010, which
means it's not coming from the video stuff or the screen fence stuff, but
rather is a PIPE_QUERY_GPU_FINISHED query. Which is interesting, because
nothing appears to actually use that PIPE_QUERY type...

Could you stick a assert(0) right before

      nv50_query_get(push, q, 0, 0x1000f010);

in nv50_query.c and see if it triggers (make sure to use a debug build... or
make it something nastier than assert), and get a backtrace from gdb? (Or
actually just set a breakpoint on that line and see if gdb hits it...)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409676942.2D460D0C2.2011--

--===============1114984717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1114984717==--
