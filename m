From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58735] GeForce 680, currently driver works on two,
 but not three monitors
Date: Sat, 29 Dec 2012 06:44:42 +0000
Message-ID: <bug-58735-8800-B82DVfKs65@http.bugs.freedesktop.org/>
References: <bug-58735-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1076212003=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58735-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1076212003==
Content-Type: multipart/alternative; boundary="1356763482.Adb4ac12.7921"; charset="us-ascii"


--1356763482.Adb4ac12.7921
Date: Sat, 29 Dec 2012 06:44:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58735

--- Comment #5 from Aleksi Torhamo <alexerion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can confirm this. Tested with the latest nouveau kernel (commit
73e5cf2d9af6bb32b91f8a2f6d7c44c8e9b4e785) and a GeForce GTX 660 (nve6). All
three screens worked with nouveau on kernel 3.6.11, but on this one, one stays
blank.

If I disable one of the outputs that work by default, the one that didn't work
comes to life instead:

  Section "Device"
    ...
    Option "monitor-OUTPUT" "MonitorX"
  EndSection

  Section "Monitor"
    Identifier "MonitorX"
    Option "Ignore" "true"
  EndSection

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356763482.Adb4ac12.7921
Date: Sat, 29 Dec 2012 06:44:42 +0000
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
   title="NEW --- - GeForce 680, currently driver works on two, but not three monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58735#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GeForce 680, currently driver works on two, but not three monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58735">bug 58735</a>
              from <span class="vcard"><a class="email" href="mailto:alexerion&#64;gmail.com" title="Aleksi Torhamo &lt;alexerion&#64;gmail.com&gt;"> <span class="fn">Aleksi Torhamo</span></a>
</span></b>
        <pre>I can confirm this. Tested with the latest nouveau kernel (commit
73e5cf2d9af6bb32b91f8a2f6d7c44c8e9b4e785) and a GeForce GTX 660 (nve6). All
three screens worked with nouveau on kernel 3.6.11, but on this one, one stays
blank.

If I disable one of the outputs that work by default, the one that didn't work
comes to life instead:

  Section &quot;Device&quot;
    ...
    Option &quot;monitor-OUTPUT&quot; &quot;MonitorX&quot;
  EndSection

  Section &quot;Monitor&quot;
    Identifier &quot;MonitorX&quot;
    Option &quot;Ignore&quot; &quot;true&quot;
  EndSection</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356763482.Adb4ac12.7921--

--===============1076212003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1076212003==--
