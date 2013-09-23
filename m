From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69029] [NVA8] GPU lockup since kernel 3.11 upgrade
Date: Mon, 23 Sep 2013 19:20:10 +0000
Message-ID: <bug-69029-8800-tzFJQEl7GJ@http.bugs.freedesktop.org/>
References: <bug-69029-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0940855716=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69029-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0940855716==
Content-Type: multipart/alternative; boundary="1379964010.6Cb22.4036"; charset="us-ascii"


--1379964010.6Cb22.4036
Date: Mon, 23 Sep 2013 19:20:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69029

--- Comment #4 from charon00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have also been encountering problems with the X server crashing in kernel
3.11.1 in Fedora 19 64-bit (KDE desktop).  Usually the desktop locks up and
eventually drops to command line where messages like the following are printed:

nouveau E[ X[945]] failed to idle channel 0xcccc0000 [X[945]]
nouveau E[ X[945]] failed to idle channel 0xcccc0000 [X[945]]
nouveau E[    PFB][0000:01:00.0] trapped read at 0x002001a040 on channel
0x0003fb1a [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379964010.6Cb22.4036
Date: Mon, 23 Sep 2013 19:20:10 +0000
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
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69029#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69029">bug 69029</a>
              from <span class="vcard"><a class="email" href="mailto:charon00&#64;gmail.com" title="charon00&#64;gmail.com">charon00&#64;gmail.com</a>
</span></b>
        <pre>I have also been encountering problems with the X server crashing in kernel
3.11.1 in Fedora 19 64-bit (KDE desktop).  Usually the desktop locks up and
eventually drops to command line where messages like the following are printed:

nouveau E[ X[945]] failed to idle channel 0xcccc0000 [X[945]]
nouveau E[ X[945]] failed to idle channel 0xcccc0000 [X[945]]
nouveau E[    PFB][0000:01:00.0] trapped read at 0x002001a040 on channel
0x0003fb1a [unknown] SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379964010.6Cb22.4036--

--===============0940855716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0940855716==--
