From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] The new nouveau kernel module fails to use my
 monitor's native resolution
Date: Sat, 25 Jan 2014 10:20:23 +0000
Message-ID: <bug-40747-8800-lGKePdaXOT@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1812250165=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1812250165==
Content-Type: multipart/alternative; boundary="1390645223.D17E0b353.2822"; charset="us-ascii"


--1390645223.D17E0b353.2822
Date: Sat, 25 Jan 2014 10:20:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #17 from Oswald Buddenhagen <ossi-RoXCvvDuEio@public.gmane.org> ---
Created attachment 92765
  --> https://bugs.freedesktop.org/attachment.cgi?id=92765&action=edit
another Xorg.0.log with bogus resolution

note that after the VT switch, there is suddely a "Printing DDC gathered
Modelines" section, which indicates that some 1600x1200 mode was at leaast
found.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390645223.D17E0b353.2822
Date: Sat, 25 Jan 2014 10:20:23 +0000
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
   title="REOPENED --- - The new nouveau kernel module fails to use my monitor's native resolution"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - The new nouveau kernel module fails to use my monitor's native resolution"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:ossi&#64;kde.org" title="Oswald Buddenhagen &lt;ossi&#64;kde.org&gt;"> <span class="fn">Oswald Buddenhagen</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92765" name="attach_92765" title="another Xorg.0.log with bogus resolution">attachment 92765</a> <a href="attachment.cgi?id=92765&amp;action=edit" title="another Xorg.0.log with bogus resolution">[details]</a></span>
another Xorg.0.log with bogus resolution

note that after the VT switch, there is suddely a &quot;Printing DDC gathered
Modelines&quot; section, which indicates that some 1600x1200 mode was at leaast
found.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390645223.D17E0b353.2822--

--===============1812250165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1812250165==--
