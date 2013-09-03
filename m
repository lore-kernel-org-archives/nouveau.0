From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67255] [NVC3] black screen after resuming from
	Hibernate
Date: Tue, 03 Sep 2013 19:13:20 +0000
Message-ID: <bug-67255-8800-snB0oRzHOj@http.bugs.freedesktop.org/>
References: <bug-67255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0555552828=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0555552828==
Content-Type: multipart/alternative; boundary="1378235600.ECb751d2.28441"; charset="us-ascii"


--1378235600.ECb751d2.28441
Date: Tue, 3 Sep 2013 19:13:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67255

--- Comment #6 from Diether Knof <dknof-Mmb7MZpHnFY@public.gmane.org> ---
Hello,

I am having the same problem.
System: gentoo
kernel: 3.10.7-gentoo, 3.8.13-gentoo, 3.11 (from kernel.org)

The problem arises without X, I have called '/usr/sbin/hibernate -v3' directly
after startup (no X is started automatically).
In /var/log/messages there are more then 400 lines as 
  Sep  3 20:20:39 localhost kernel: nouveau E[    PBUS][0000:01:00.0] MMIO read
of 0x00000000 FAULT at 0x610260 [ IBUS ]
(even the same timestamp).

Greetings
Diether

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378235600.ECb751d2.28441
Date: Tue, 3 Sep 2013 19:13:20 +0000
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
   title="NEW --- - [NVC3] black screen after resuming from Hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67255#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC3] black screen after resuming from Hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67255">bug 67255</a>
              from <span class="vcard"><a class="email" href="mailto:dknof&#64;gmx.de" title="Diether Knof &lt;dknof&#64;gmx.de&gt;"> <span class="fn">Diether Knof</span></a>
</span></b>
        <pre>Hello,

I am having the same problem.
System: gentoo
kernel: 3.10.7-gentoo, 3.8.13-gentoo, 3.11 (from kernel.org)

The problem arises without X, I have called '/usr/sbin/hibernate -v3' directly
after startup (no X is started automatically).
In /var/log/messages there are more then 400 lines as 
  Sep  3 20:20:39 localhost kernel: nouveau E[    PBUS][0000:01:00.0] MMIO read
of 0x00000000 FAULT at 0x610260 [ IBUS ]
(even the same timestamp).

Greetings
Diether</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378235600.ECb751d2.28441--

--===============0555552828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0555552828==--
