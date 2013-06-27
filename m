From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Enabling Xinerama with nouveau driver causes
 Segmentation fault
Date: Thu, 27 Jun 2013 13:46:09 +0000
Message-ID: <bug-66255-8800-CN2Dw6mqUx@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0528550585=="
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


--===============0528550585==
Content-Type: multipart/alternative; boundary="1372340769.Ef14f5aC1.18935"; charset="us-ascii"


--1372340769.Ef14f5aC1.18935
Date: Thu, 27 Jun 2013 13:46:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #4 from Trev Jackson <trev.g7pvs-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
 Your comment was:

    I'm trying to drive 4 monitors in a 2x2 configuration using as single video
card, which appears as two cards with two outputs on each card.
    Without using an xorg.conf file two of the monitors by default are set up
as one display and the other two monitors are black, althought the log file
does show the other displays are detected.
    With my xorg.conf file I now have two monitors as one display and the other
two monitors as a second display :0.0 and :0.1, although only :0.0 has a menu
at the top of the screen.
    I am running the latest version of Fedora - downloaded it a few days ago.
    I have had a similar configuration working for some time, but with Kubuntu
and two physically distinct ATI cards and the closed source driver, only
changed configuration because one of the cards failed.  As part of trying to
get up and running again I'm now using a different video card and have switched
to Fedora.
    When I enable Xinerama I get a segmentation fault (log file attached).
    I gather I am supposed to have a Screen 0 and Screen 1 for each pair of
outputs in the Device sections, however if I uncomment those lines X stalls on
startup, but doesn't crash - I can still log on using <Ctrl><Alt><F2>
    Any help woudld be appreciated.
    Best Regards
    Trev

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372340769.Ef14f5aC1.18935
Date: Thu, 27 Jun 2013 13:46:09 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:trev.g7pvs&#64;ntlworld.com" title="Trev Jackson &lt;trev.g7pvs&#64;ntlworld.com&gt;"> <span class="fn">Trev Jackson</span></a>
</span></b>
        <pre> Your comment was:

    I'm trying to drive 4 monitors in a 2x2 configuration using as single video
card, which appears as two cards with two outputs on each card.
    Without using an xorg.conf file two of the monitors by default are set up
as one display and the other two monitors are black, althought the log file
does show the other displays are detected.
    With my xorg.conf file I now have two monitors as one display and the other
two monitors as a second display :0.0 and :0.1, although only :0.0 has a menu
at the top of the screen.
    I am running the latest version of Fedora - downloaded it a few days ago.
    I have had a similar configuration working for some time, but with Kubuntu
and two physically distinct ATI cards and the closed source driver, only
changed configuration because one of the cards failed.  As part of trying to
get up and running again I'm now using a different video card and have switched
to Fedora.
    When I enable Xinerama I get a segmentation fault (log file attached).
    I gather I am supposed to have a Screen 0 and Screen 1 for each pair of
outputs in the Device sections, however if I uncomment those lines X stalls on
startup, but doesn't crash - I can still log on using &lt;Ctrl&gt;&lt;Alt&gt;&lt;F2&gt;
    Any help woudld be appreciated.
    Best Regards
    Trev</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372340769.Ef14f5aC1.18935--

--===============0528550585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0528550585==--
