From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75094] NV92 is faster and runs games fine than NVE6,
	why?
Date: Tue, 18 Feb 2014 18:59:47 +0000
Message-ID: <bug-75094-8800-esnvAUwvwg@http.bugs.freedesktop.org/>
References: <bug-75094-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0162292453=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75094-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0162292453==
Content-Type: multipart/alternative; boundary="1392749987.77601781.14256"; charset="us-ascii"


--1392749987.77601781.14256
Date: Tue, 18 Feb 2014 18:59:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75094

--- Comment #3 from Matthias Nagel <matthias.h.nagel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A pose this question only to make things more clear to me, because I own a
650TI, too. I have the following dmesg output during boot:

nouveau  [     DRM] 4 available performance level(s)
nouveau  [     DRM] 0: core 162MHz shader 324MHz memory 648MHz voltage 100mV
nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz voltage 80mV
nouveau  [     DRM] 2: core 1502MHz shader 3004MHz memory 1080MHz voltage 60mV
nouveau  [     DRM] 3: core 1502MHz shader 3004MHz memory 1080MHz voltage 40mV

Do I understand you correctly: Nouveau always uses level 0, this is to say
162MHz (for core), 324MHz (for shader) and 648MHz (for memory) regardless how
much work the card is faced with?

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392749987.77601781.14256
Date: Tue, 18 Feb 2014 18:59:47 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - NV92 is faster and runs games fine than NVE6, why?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75094#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - NV92 is faster and runs games fine than NVE6, why?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75094">bug 75094</a>
              from <span class="vcard"><a class="email" href="mailto:matthias.h.nagel&#64;gmail.com" title="Matthias Nagel &lt;matthias.h.nagel&#64;gmail.com&gt;"> <span class="fn">Matthias Nagel</span></a>
</span></b>
        <pre>A pose this question only to make things more clear to me, because I own a
650TI, too. I have the following dmesg output during boot:

nouveau  [     DRM] 4 available performance level(s)
nouveau  [     DRM] 0: core 162MHz shader 324MHz memory 648MHz voltage 100mV
nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz voltage 80mV
nouveau  [     DRM] 2: core 1502MHz shader 3004MHz memory 1080MHz voltage 60mV
nouveau  [     DRM] 3: core 1502MHz shader 3004MHz memory 1080MHz voltage 40mV

Do I understand you correctly: Nouveau always uses level 0, this is to say
162MHz (for core), 324MHz (for shader) and 648MHz (for memory) regardless how
much work the card is faced with?

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392749987.77601781.14256--

--===============0162292453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0162292453==--
