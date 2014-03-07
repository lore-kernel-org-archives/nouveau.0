From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Fri, 07 Mar 2014 21:21:05 +0000
Message-ID: <bug-70390-8800-wC5FjXbDVQ@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0139818302=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0139818302==
Content-Type: multipart/alternative; boundary="1394227266.f3DA3D6c3.12766"; charset="us-ascii"


--1394227266.f3DA3D6c3.12766
Date: Fri, 7 Mar 2014 21:21:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #16 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
Created attachment 95315
  --> https://bugs.freedesktop.org/attachment.cgi?id=95315&action=edit
Mar 05 incident

My system keeps crashing on me, and quite often this DMA_PUSHER INVALID_CMD is
the last line in ther kernel log. I also had one X lockup, where I could ssh
into the machine and see a message in the log as well. Trying to reboot the
system I got a number of "failed to idle channel" messages I'm attaching the
log for that.

Today I got a crash without log message, but perhaps the machine was simply
unable to flush the log. I triggered that by launching flightgear. Since that's
the first time I launched flightgear, I guess this bug here makes that package
unusable for me, which is very sad.

I'm still willing to help fix this, but I'll need instructions as I wrote in
comment #14. If there is any other way to help, let me know.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394227266.f3DA3D6c3.12766
Date: Fri, 7 Mar 2014 21:21:06 +0000
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
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=95315" name="attach_95315" title="Mar 05 incident">attachment 95315</a> <a href="attachment.cgi?id=95315&amp;action=edit" title="Mar 05 incident">[details]</a></span>
Mar 05 incident

My system keeps crashing on me, and quite often this DMA_PUSHER INVALID_CMD is
the last line in ther kernel log. I also had one X lockup, where I could ssh
into the machine and see a message in the log as well. Trying to reboot the
system I got a number of &quot;failed to idle channel&quot; messages I'm attaching the
log for that.

Today I got a crash without log message, but perhaps the machine was simply
unable to flush the log. I triggered that by launching flightgear. Since that's
the first time I launched flightgear, I guess this bug here makes that package
unusable for me, which is very sad.

I'm still willing to help fix this, but I'll need instructions as I wrote in
<a href="show_bug.cgi?id=70390#c14">comment #14</a>. If there is any other way to help, let me know.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394227266.f3DA3D6c3.12766--

--===============0139818302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0139818302==--
