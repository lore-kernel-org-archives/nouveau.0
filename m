From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83168] No display after suspend to RAM
Date: Thu, 28 Aug 2014 00:27:38 +0000
Message-ID: <bug-83168-8800-yOIsasrySf@http.bugs.freedesktop.org/>
References: <bug-83168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1399988637=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1399988637==
Content-Type: multipart/alternative; boundary="1409185658.Ef2B1.27497"; charset="us-ascii"


--1409185658.Ef2B1.27497
Date: Thu, 28 Aug 2014 00:27:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83168

--- Comment #1 from Neven Sajko <nsajko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
lspci output:
VGA compatible controller: NVIDIA Corporation G72M [Quadro NVS 110M/GeForce Go
7300] (rev a1) (prog-if 00 [VGA controller])

dmesg | grep -i chipset
[    0.965969] nouveau  [  DEVICE][0000:01:00.0] Chipset: G72 (NV46)


Do I have to take a MMIO dump?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409185658.Ef2B1.27497
Date: Thu, 28 Aug 2014 00:27:38 +0000
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
   title="NEW --- - No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168">bug 83168</a>
              from <span class="vcard"><a class="email" href="mailto:nsajko&#64;gmail.com" title="Neven Sajko &lt;nsajko&#64;gmail.com&gt;"> <span class="fn">Neven Sajko</span></a>
</span></b>
        <pre>lspci output:
VGA compatible controller: NVIDIA Corporation G72M [Quadro NVS 110M/GeForce Go
7300] (rev a1) (prog-if 00 [VGA controller])

dmesg | grep -i chipset
[    0.965969] nouveau  [  DEVICE][0000:01:00.0] Chipset: G72 (NV46)


Do I have to take a MMIO dump?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409185658.Ef2B1.27497--

--===============1399988637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1399988637==--
