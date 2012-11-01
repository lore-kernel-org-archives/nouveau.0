From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56347] NVPlatformProbe routine does not mark the
 entity as Shared for ZaphodHeads.
Date: Thu, 01 Nov 2012 03:08:16 +0000
Message-ID: <bug-56347-8800-1iNe4QoVmJ@http.bugs.freedesktop.org/>
References: <bug-56347-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2030970447=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56347-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2030970447==
Content-Type: multipart/alternative; boundary="1351739296.18AcaC2.25323"; charset="us-ascii"


--1351739296.18AcaC2.25323
Date: Thu, 1 Nov 2012 03:08:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56347

--- Comment #1 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> ---
Confirming the bug.

02:59 < Nowaker> after distro upgrade I am no longer able to use my 2 gpus, 3
monitors. looks like zaphodheads doesn't work as expected. Screen0 on GPU0 is
OK, Screen1 on GPU0 fails, Screen2 on GPU1 is OK. fail message: Screen 1
deleted because of no matching config section. xorg.conf:
http://wklej.org/id/555276/txt/ This is the bug that was fixed a year ago for
me. https://bugs.freedesktop.org/show_bug.cgi?id=39099
03:00 < Nowaker> instead of getting two screens of GPU0 with zaphodheads, I get
one (output DVI-I-1) and a clone (output DVI-I-2)
03:01 < Nowaker> something must have been broken along the way, I will check
the version of nouveau I was using in my previous distro
03:27 < Nowaker> definitely ZaphodHeads broken in current nouveau
03:28 < Nowaker> [  5849.183] Requested Entity already in use!
03:28 < Nowaker> this is not supposed to happen when ZaphodHeads is defined
03:31 < Nowaker> confirmed, http://www.spinics.net/lists/xorg/msg54660.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351739296.18AcaC2.25323
Date: Thu, 1 Nov 2012 03:08:16 +0000
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
   title="NEW --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347">bug 56347</a>
              from <span class="vcard"><a class="email" href="mailto:nowaker&#64;geozone.pl" title="Damian Nowak &lt;nowaker&#64;geozone.pl&gt;"> <span class="fn">Damian Nowak</span></a>
</span></b>
        <pre>Confirming the bug.

02:59 &lt; Nowaker&gt; after distro upgrade I am no longer able to use my 2 gpus, 3
monitors. looks like zaphodheads doesn't work as expected. Screen0 on GPU0 is
OK, Screen1 on GPU0 fails, Screen2 on GPU1 is OK. fail message: Screen 1
deleted because of no matching config section. xorg.conf:
<a href="http://wklej.org/id/555276/txt/">http://wklej.org/id/555276/txt/</a> This is the bug that was fixed a year ago for
me. <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - two graphic cards and four monitors with Nouveau"
   href="show_bug.cgi?id=39099">https://bugs.freedesktop.org/show_bug.cgi?id=39099</a>
03:00 &lt; Nowaker&gt; instead of getting two screens of GPU0 with zaphodheads, I get
one (output DVI-I-1) and a clone (output DVI-I-2)
03:01 &lt; Nowaker&gt; something must have been broken along the way, I will check
the version of nouveau I was using in my previous distro
03:27 &lt; Nowaker&gt; definitely ZaphodHeads broken in current nouveau
03:28 &lt; Nowaker&gt; [  5849.183] Requested Entity already in use!
03:28 &lt; Nowaker&gt; this is not supposed to happen when ZaphodHeads is defined
03:31 &lt; Nowaker&gt; confirmed, <a href="http://www.spinics.net/lists/xorg/msg54660.html">http://www.spinics.net/lists/xorg/msg54660.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351739296.18AcaC2.25323--

--===============2030970447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2030970447==--
