From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Enabling Xinerama with nouveau driver causes
 Segmentation fault
Date: Fri, 28 Jun 2013 17:57:11 +0000
Message-ID: <bug-66255-8800-EpWixuTC5r@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1123788010=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1123788010==
Content-Type: multipart/alternative; boundary="1372442231.c3Dda1.23070"; charset="us-ascii"


--1372442231.c3Dda1.23070
Date: Fri, 28 Jun 2013 17:57:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #10 from Trev Jackson <trev.g7pvs-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
I've made a copy of the example xorg.conf, only changing the address of the PCI
addresses, it runs and it produces a small window saying it is in fallback mode
and obviously as I want to run a 2x2 configuration the displays were in the
wrong place.  Just altering it to put the displays in the correct place causes
all displays to come up as black.
This may be caused by one of the monitors only being capable of 1024x768 and
the others being capable of 1280x1024 and the driver not being able to sort it
out.
I've altered xorg.conf to set all the displays to default to 1024x768 and now
it starts up, but when I try to expand or drag a window from display DVI-I-1 to
any of the other displays the only thing visible in the other displays is the
mouse.
All of the above were attempted using 1.0.8 with the section you suggested
commented out.
I'll attach the latest xorg.conf file

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372442231.c3Dda1.23070
Date: Fri, 28 Jun 2013 17:57:11 +0000
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
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:trev.g7pvs&#64;ntlworld.com" title="Trev Jackson &lt;trev.g7pvs&#64;ntlworld.com&gt;"> <span class="fn">Trev Jackson</span></a>
</span></b>
        <pre>I've made a copy of the example xorg.conf, only changing the address of the PCI
addresses, it runs and it produces a small window saying it is in fallback mode
and obviously as I want to run a 2x2 configuration the displays were in the
wrong place.  Just altering it to put the displays in the correct place causes
all displays to come up as black.
This may be caused by one of the monitors only being capable of 1024x768 and
the others being capable of 1280x1024 and the driver not being able to sort it
out.
I've altered xorg.conf to set all the displays to default to 1024x768 and now
it starts up, but when I try to expand or drag a window from display DVI-I-1 to
any of the other displays the only thing visible in the other displays is the
mouse.
All of the above were attempted using 1.0.8 with the section you suggested
commented out.
I'll attach the latest xorg.conf file</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372442231.c3Dda1.23070--

--===============1123788010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1123788010==--
