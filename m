From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64858] Nouveau sees invalid EDID for eDP-1 whenever
 that display is turned off
Date: Wed, 22 May 2013 10:08:39 +0000
Message-ID: <bug-64858-8800-gaoBcAdedw@http.bugs.freedesktop.org/>
References: <bug-64858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614858363=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1614858363==
Content-Type: multipart/alternative; boundary="1369217318.54B41.28944"; charset="us-ascii"


--1369217318.54B41.28944
Date: Wed, 22 May 2013 10:08:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64858

--- Comment #1 from gspr <gspreemann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
If it is of any interest, the EDIDs reported when off and when on are
suspiciously similar:

When OFF
00ff ffff ffff ff00 06af 4741 0000 0000
2250 5400 0000 0101 0101 0101 0101 0101
0101 0101 0101 9425 a03e 5184 0c30 4020
3300 2fbd 1000 001a 0d19 a03e 5184 0c30
4020 3300 2fbd 1000 001a 0000 00fe 0043
4358 4d57 8042 3134 3150 5734 0000 0000
0000 4121 1e00 0000 0009 010a 2020 009d
0000 0000 0000 0000 0000 0000 0000 0000

When ON
00ff ffff ffff ff00 06af 4741 0000 0000
0113 0104 951e 1378 0289 e594 5754 9327
2250 5400 0000 0101 0101 0101 0101 0101
0101 0101 0101 9425 a03e 5184 0c30 4020
3300 2fbd 1000 001a 0d19 a03e 5184 0c30
4020 3300 2fbd 1000 001a 0000 00fe 0043
4358 4d57 8042 3134 3150 5734 0000 0000
0000 4121 1e00 0000 0009 010a 2020 009d

As you can see, the EDID when off simply lacks the second line (bytes 9-16).
Again, this could of course be my hardware misbehaving.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369217318.54B41.28944
Date: Wed, 22 May 2013 10:08:38 +0000
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
   title="NEW --- - Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858">bug 64858</a>
              from <span class="vcard"><a class="email" href="mailto:gspreemann&#64;gmail.com" title="gspr &lt;gspreemann&#64;gmail.com&gt;"> <span class="fn">gspr</span></a>
</span></b>
        <pre>If it is of any interest, the EDIDs reported when off and when on are
suspiciously similar:

When OFF
00ff ffff ffff ff00 06af 4741 0000 0000
2250 5400 0000 0101 0101 0101 0101 0101
0101 0101 0101 9425 a03e 5184 0c30 4020
3300 2fbd 1000 001a 0d19 a03e 5184 0c30
4020 3300 2fbd 1000 001a 0000 00fe 0043
4358 4d57 8042 3134 3150 5734 0000 0000
0000 4121 1e00 0000 0009 010a 2020 009d
0000 0000 0000 0000 0000 0000 0000 0000

When ON
00ff ffff ffff ff00 06af 4741 0000 0000
0113 0104 951e 1378 0289 e594 5754 9327
2250 5400 0000 0101 0101 0101 0101 0101
0101 0101 0101 9425 a03e 5184 0c30 4020
3300 2fbd 1000 001a 0d19 a03e 5184 0c30
4020 3300 2fbd 1000 001a 0000 00fe 0043
4358 4d57 8042 3134 3150 5734 0000 0000
0000 4121 1e00 0000 0009 010a 2020 009d

As you can see, the EDID when off simply lacks the second line (bytes 9-16).
Again, this could of course be my hardware misbehaving.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369217318.54B41.28944--

--===============1614858363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1614858363==--
