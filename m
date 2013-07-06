From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66650] [regression][NVD0] 'drm/nve0-/gr: some new
 gpc registers can have multiple copies' causes lockups
Date: Sat, 06 Jul 2013 19:15:59 +0000
Message-ID: <bug-66650-8800-InY7sOtvHv@http.bugs.freedesktop.org/>
References: <bug-66650-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0062304516=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66650-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0062304516==
Content-Type: multipart/alternative; boundary="1373138159.dffE1.3690"; charset="us-ascii"


--1373138159.dffE1.3690
Date: Sat, 6 Jul 2013 19:15:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66650

--- Comment #2 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ow and:

06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a

Also happens occasionally (Firefox) under 'normal' circumstances. But after the
lock-up, it happens more often.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373138159.dffE1.3690
Date: Sat, 6 Jul 2013 19:15:59 +0000
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
   title="NEW --- - [regression][NVD0] 'drm/nve0-/gr: some new gpc registers can have multiple copies' causes lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66650#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][NVD0] 'drm/nve0-/gr: some new gpc registers can have multiple copies' causes lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66650">bug 66650</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Ow and:

06-07-2013 17:17 .warning ::: nouveau W[   PFIFO][0000:01:00.0] INTR
0x00000100: 0x0000000a

Also happens occasionally (Firefox) under 'normal' circumstances. But after the
lock-up, it happens more often.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373138159.dffE1.3690--

--===============0062304516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0062304516==--
