From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP, PFIFO,
 PGRAPH and PGR errors
Date: Sun, 30 Aug 2015 09:51:55 +0000
Message-ID: <bug-90453-8800-4A7AzC5UcS@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2074490154=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2074490154==
Content-Type: multipart/alternative; boundary="1440928315.CeB74F3.10835"; charset="UTF-8"


--1440928315.CeB74F3.10835
Date: Sun, 30 Aug 2015 09:51:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #24 from Timothy Pearson <kb9vqf-q76TEfyATldW60MLeMDbCeTW4wlIGRCZ@public.gmane.org> ---
(In reply to Mario Barrera from comment #23)
> Same issue over here, it is a NVE4 too. I will be using the proprietary
> driver from now on until I know better how to help diagnose this.
> 
> [ 7104.402763] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT
> ]
> [ 7104.402770] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
> channel 7, recovering...
> 
> ...and video freezes forever.

Unfortunately I'm seeing the same problem.  I have been able to reproduce it
very consistently under two circumstances:
1.) Starting a new X11 session when one is already running (using TDM, a fork
of the older KDE 3.5 KDM)
2.) Trying to select an OpenGL screensaver.  If you go through the list of
OpenGL screensavers, occasionally selecting one for full-screen preview, the
GPU will hang after going through no more than around a dozen savers.

Reclocking status does not matter; fault occurs on both low and high clocks.

Kernel 4.1:
[  914.928160] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000490000
[PTE] from GR/SCC on channel 0x00fec92000 [matrixview[27252]]
[  914.928169] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering..

Going back to the proprietary drivers is not an option here due to a serious
bug in those drivers, so if there's anything I can do to help diagnose this
issue please let me know.

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440928315.CeB74F3.10835
Date: Sun, 30 Aug 2015 09:51:55 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:kb9vqf&#64;pearsoncomputing.net" title="Timothy Pearson &lt;kb9vqf&#64;pearsoncomputing.net&gt;"> <span class="fn">Timothy Pearson</span></a>
</span></b>
        <pre>(In reply to Mario Barrera from <a href="show_bug.cgi?id=90453#c23">comment #23</a>)
<span class="quote">&gt; Same issue over here, it is a NVE4 too. I will be using the proprietary
&gt; driver from now on until I know better how to help diagnose this.
&gt; 
&gt; [ 7104.402763] nouveau E[   PFIFO][0000:01:00.0] SCHED_ERROR [ CTXSW_TIMEOUT
&gt; ]
&gt; [ 7104.402770] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
&gt; channel 7, recovering...
&gt; 
&gt; ...and video freezes forever.</span >

Unfortunately I'm seeing the same problem.  I have been able to reproduce it
very consistently under two circumstances:
1.) Starting a new X11 session when one is already running (using TDM, a fork
of the older KDE 3.5 KDM)
2.) Trying to select an OpenGL screensaver.  If you go through the list of
OpenGL screensavers, occasionally selecting one for full-screen preview, the
GPU will hang after going through no more than around a dozen savers.

Reclocking status does not matter; fault occurs on both low and high clocks.

Kernel 4.1:
[  914.928160] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0000490000
[PTE] from GR/SCC on channel 0x00fec92000 [matrixview[27252]]
[  914.928169] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering..

Going back to the proprietary drivers is not an option here due to a serious
bug in those drivers, so if there's anything I can do to help diagnose this
issue please let me know.

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440928315.CeB74F3.10835--

--===============2074490154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2074490154==--
