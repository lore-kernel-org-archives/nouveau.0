From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78106] Reported fan rpm is twice the actual value
	(NVC0)
Date: Wed, 30 Apr 2014 09:31:09 +0000
Message-ID: <bug-78106-8800-baqToH6tNH@http.bugs.freedesktop.org/>
References: <bug-78106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0312857351=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78106-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0312857351==
Content-Type: multipart/alternative; boundary="1398850269.3E062.4203"; charset="us-ascii"


--1398850269.3E062.4203
Date: Wed, 30 Apr 2014 09:31:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78106

--- Comment #2 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
Hi Marcel,

I was expecting to get a bug report on that much sooner. I will need to dive in
the vbios tables again to fix this.

The way fan speed is calculated is by reading the number of impulsions sent by
the hw tachometer. The tachometer has 1/2/4 or 8 pulses per turn. I couldn't
find information in the vbios as for how many pulses per turn I should expect.
I made it to work for all my cards (the same value worked everywhere) and
thought maybe NVIDIA forced manufacturers to use fans with the right number of
pulses per rotation (although it was weird).

Could you extract your vbios[0] and attach it to this bug report? It will help
me in my quest to find the byte I'm looking for!

Thanks!

[0] http://nouveau.freedesktop.org/wiki/DumpingVideoBios/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398850269.3E062.4203
Date: Wed, 30 Apr 2014 09:31:09 +0000
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
   title="NEW --- - Reported fan rpm is twice the actual value (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78106#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Reported fan rpm is twice the actual value (NVC0)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78106">bug 78106</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>Hi Marcel,

I was expecting to get a bug report on that much sooner. I will need to dive in
the vbios tables again to fix this.

The way fan speed is calculated is by reading the number of impulsions sent by
the hw tachometer. The tachometer has 1/2/4 or 8 pulses per turn. I couldn't
find information in the vbios as for how many pulses per turn I should expect.
I made it to work for all my cards (the same value worked everywhere) and
thought maybe NVIDIA forced manufacturers to use fans with the right number of
pulses per rotation (although it was weird).

Could you extract your vbios[0] and attach it to this bug report? It will help
me in my quest to find the byte I'm looking for!

Thanks!

[0] <a href="http://nouveau.freedesktop.org/wiki/DumpingVideoBios/">http://nouveau.freedesktop.org/wiki/DumpingVideoBios/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398850269.3E062.4203--

--===============0312857351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0312857351==--
