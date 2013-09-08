From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Sun, 08 Sep 2013 06:54:41 +0000
Message-ID: <bug-21273-8800-B1OpZoJ8S1@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0322213951=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0322213951==
Content-Type: multipart/alternative; boundary="1378623281.D34a13c81.27821"; charset="us-ascii"


--1378623281.D34a13c81.27821
Date: Sun, 8 Sep 2013 06:54:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #84 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Did you try the other ways of obtaining the vbios? (e.g. using pramin with
nvagetbios, or looking in the path I mentioned, with debugfs mounted, and
nouveau loaded).

Also, would love to see a kernel log for a semi-recent kernel (say, 3.8+) that
shows what nouveau thinks it's doing.

The fact that you only see the VGA-1 connector is clearly a bad sign -- you
should have 2 DVI-I connectors, and no VGA connectors (based on the photo).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378623281.D34a13c81.27821
Date: Sun, 8 Sep 2013 06:54:41 +0000
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c84">Comment # 84</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Did you try the other ways of obtaining the vbios? (e.g. using pramin with
nvagetbios, or looking in the path I mentioned, with debugfs mounted, and
nouveau loaded).

Also, would love to see a kernel log for a semi-recent kernel (say, 3.8+) that
shows what nouveau thinks it's doing.

The fact that you only see the VGA-1 connector is clearly a bad sign -- you
should have 2 DVI-I connectors, and no VGA connectors (based on the photo).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378623281.D34a13c81.27821--

--===============0322213951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0322213951==--
