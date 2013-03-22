From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62351] Segfault in nouveau_dri.so
Date: Fri, 22 Mar 2013 21:48:06 +0000
Message-ID: <bug-62351-8800-PxVLwMCukc@http.bugs.freedesktop.org/>
References: <bug-62351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2065843867=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2065843867==
Content-Type: multipart/alternative; boundary="1363988886.a2cBcbCB2.7074"; charset="us-ascii"


--1363988886.a2cBcbCB2.7074
Date: Fri, 22 Mar 2013 21:48:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62351

--- Comment #4 from klausenbusk-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org ---
I can also confirm this bug, same error. Nvidia GeForce 8600 GT on Arch Linux
tested with mesa from git today (22/3) and 11/3.
[   21.613812] gnome-shell[431]: segfault at 1 ip 00007fb252ea8465 sp
00007fff9e19bc00 error 4 in nouveau_dri.so[7fb252968000+121b000]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363988886.a2cBcbCB2.7074
Date: Fri, 22 Mar 2013 21:48:06 +0000
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
   title="NEW --- - Segfault in nouveau_dri.so"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62351#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Segfault in nouveau_dri.so"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62351">bug 62351</a>
              from <span class="vcard"><a class="email" href="mailto:klausenbusk&#64;hotmail.com" title="klausenbusk&#64;hotmail.com">klausenbusk&#64;hotmail.com</a>
</span></b>
        <pre>I can also confirm this bug, same error. Nvidia GeForce 8600 GT on Arch Linux
tested with mesa from git today (22/3) and 11/3.
[   21.613812] gnome-shell[431]: segfault at 1 ip 00007fb252ea8465 sp
00007fff9e19bc00 error 4 in nouveau_dri.so[7fb252968000+121b000]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363988886.a2cBcbCB2.7074--

--===============2065843867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2065843867==--
