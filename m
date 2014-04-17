From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77586] [NV98] On recent Linux kernel (3.13 and 3.14),
 the GPU locks up around the time an X server starts
Date: Thu, 17 Apr 2014 18:02:41 +0000
Message-ID: <bug-77586-8800-haUIM1UwHy@http.bugs.freedesktop.org/>
References: <bug-77586-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1772703407=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77586-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1772703407==
Content-Type: multipart/alternative; boundary="1397757760.ecFdF8B1.31945"; charset="us-ascii"


--1397757760.ecFdF8B1.31945
Date: Thu, 17 Apr 2014 18:02:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77586

--- Comment #1 from Johannes Kloos <jkloos-41PbBDiSz5tAfugRpC6u6w@public.gmane.org> ---
Created attachment 97526
  --> https://bugs.freedesktop.org/attachment.cgi?id=97526&action=edit
ROM dump.

JFTR: Output of vbtracetool
Using card 10de:06eb on 0100
Nvidia card -- using PROM/PRAMIN BIOS
Using card memory region at 0xf5000000
Attempting to locate BIOS image in PROM... BIOS signature not found
Attempting to locate BIOS image in PRAMIN... appears to be valid

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397757760.ecFdF8B1.31945
Date: Thu, 17 Apr 2014 18:02:40 +0000
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
   title="NEW --- - [NV98] On recent Linux kernel (3.13 and 3.14), the GPU locks up around the time an X server starts"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77586#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] On recent Linux kernel (3.13 and 3.14), the GPU locks up around the time an X server starts"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77586">bug 77586</a>
              from <span class="vcard"><a class="email" href="mailto:jkloos&#64;mpi-sws.org" title="Johannes Kloos &lt;jkloos&#64;mpi-sws.org&gt;"> <span class="fn">Johannes Kloos</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=97526" name="attach_97526" title="ROM dump.">attachment 97526</a> <a href="attachment.cgi?id=97526&amp;action=edit" title="ROM dump.">[details]</a></span>
ROM dump.

JFTR: Output of vbtracetool
Using card 10de:06eb on 0100
Nvidia card -- using PROM/PRAMIN BIOS
Using card memory region at 0xf5000000
Attempting to locate BIOS image in PROM... BIOS signature not found
Attempting to locate BIOS image in PRAMIN... appears to be valid</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397757760.ecFdF8B1.31945--

--===============1772703407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1772703407==--
