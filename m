From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [bisected] G69/nv50 DisplayPort dual-head
 fails to switch to KMS
Date: Wed, 05 Jun 2013 12:57:30 +0000
Message-ID: <bug-63135-8800-gZ0ozP6DO2@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0621411259=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0621411259==
Content-Type: multipart/alternative; boundary="1370437049.7a6426B21.11513"; charset="us-ascii"


--1370437049.7a6426B21.11513
Date: Wed, 5 Jun 2013 12:57:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

--- Comment #10 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Nooo, why did it have to lead to that commit :(

Devin I don't suppose you have a debug dmesg closer to the offending commit, do
you ? The delta between these two is quite substantial

My initial suspect is that the DP data stored(or it's parsing) in is to blame
for your issue

Working
* Appears to be parsed properly?
* unknown opcode 0x44

Failing
* nouveau E[   PDISP][0000:03:00.0] DP:0006:0382: bios data not found

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370437049.7a6426B21.11513
Date: Wed, 5 Jun 2013 12:57:29 +0000
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
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Nooo, why did it have to lead to that commit :(

Devin I don't suppose you have a debug dmesg closer to the offending commit, do
you ? The delta between these two is quite substantial

My initial suspect is that the DP data stored(or it's parsing) in is to blame
for your issue

Working
* Appears to be parsed properly?
* unknown opcode 0x44

Failing
* nouveau E[   PDISP][0000:03:00.0] DP:0006:0382: bios data not found</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370437049.7a6426B21.11513--

--===============0621411259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0621411259==--
