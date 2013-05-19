From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Sun, 19 May 2013 14:28:07 +0000
Message-ID: <bug-62914-8800-xPO2SGFSIF@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1774583891=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1774583891==
Content-Type: multipart/alternative; boundary="1368973687.A3add1.30159"; charset="us-ascii"


--1368973687.A3add1.30159
Date: Sun, 19 May 2013 14:28:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #17 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> ---
I am too weak to do this bisect thing. Maybe when I invite my hacker-friend for
a beer I will manage to do that. ;-) But I took a look at `git log` and checked
out 27a1a0616304e9b9f0ae842899b7d614f1026578 (which is actually your fix for my
#56347), compiled and... it works! Will this info help you to figure out what
actually happened?

Arch Linux 20130519
xorg-server 1.14.1-1
libdrm 2.4.45-1

A complete list of all X/drm/dri-related packages: http://wklej.org/id/1042829/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368973687.A3add1.30159
Date: Sun, 19 May 2013 14:28:07 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:nowaker&#64;geozone.pl" title="Damian Nowak &lt;nowaker&#64;geozone.pl&gt;"> <span class="fn">Damian Nowak</span></a>
</span></b>
        <pre>I am too weak to do this bisect thing. Maybe when I invite my hacker-friend for
a beer I will manage to do that. ;-) But I took a look at `git log` and checked
out 27a1a0616304e9b9f0ae842899b7d614f1026578 (which is actually your fix for my
#56347), compiled and... it works! Will this info help you to figure out what
actually happened?

Arch Linux 20130519
xorg-server 1.14.1-1
libdrm 2.4.45-1

A complete list of all X/drm/dri-related packages: <a href="http://wklej.org/id/1042829/">http://wklej.org/id/1042829/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368973687.A3add1.30159--

--===============1774583891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1774583891==--
