From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81485] [NVE4] dmesg spam on startup
Date: Mon, 21 Jul 2014 21:02:44 +0000
Message-ID: <bug-81485-8800-Pj9qqEfjSZ@http.bugs.freedesktop.org/>
References: <bug-81485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1831934312=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1831934312==
Content-Type: multipart/alternative; boundary="1405976563.C5c0Ba62.30612"; charset="us-ascii"


--1405976563.C5c0Ba62.30612
Date: Mon, 21 Jul 2014 21:02:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81485

--- Comment #9 from Konstantin Svist <fry.kun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 103230
  --> https://bugs.freedesktop.org/attachment.cgi?id=103230&action=edit
extracted dmesg

Ok, as you said I added
        ram->size /=2; // KOSTYA
right after the loop
        for (part = 0; part < parts; part++) {
in function nvc0_ram_create_

Here's the dmesg from when I ran modprobe and later rmmod with this module

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405976563.C5c0Ba62.30612
Date: Mon, 21 Jul 2014 21:02:43 +0000
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
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485">bug 81485</a>
              from <span class="vcard"><a class="email" href="mailto:fry.kun&#64;gmail.com" title="Konstantin Svist &lt;fry.kun&#64;gmail.com&gt;"> <span class="fn">Konstantin Svist</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=103230" name="attach_103230" title="extracted dmesg">attachment 103230</a> <a href="attachment.cgi?id=103230&amp;action=edit" title="extracted dmesg">[details]</a></span>
extracted dmesg

Ok, as you said I added
        ram-&gt;size /=2; // KOSTYA
right after the loop
        for (part = 0; part &lt; parts; part++) {
in function nvc0_ram_create_

Here's the dmesg from when I ran modprobe and later rmmod with this module</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405976563.C5c0Ba62.30612--

--===============1831934312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1831934312==--
