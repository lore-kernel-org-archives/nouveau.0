From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] Nouveau KMS framebuffer hand-over: no/black
 console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok
Date: Sun, 29 Jun 2014 12:32:55 +0000
Message-ID: <bug-80675-8800-c18ANzeztT@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0709378939=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0709378939==
Content-Type: multipart/alternative; boundary="1404045175.4CD62a6b1.25633"; charset="us-ascii"


--1404045175.4CD62a6b1.25633
Date: Sun, 29 Jun 2014 12:32:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80675

--- Comment #1 from Walter Haidinger <walter.haidinger-RbZlAiThDcE@public.gmane.org> ---
Created attachment 101975
  --> https://bugs.freedesktop.org/attachment.cgi?id=101975&action=edit
vbtracetool rom dump

Created a rom dump as suggested on
http://nouveau.freedesktop.org/wiki/DumpingVideoBios/

# ./vbtracetool -w 2> 1043-82e2.rom
Using card 10de:0848 on 0200
Nvidia card -- using PROM/PRAMIN BIOS
Using card memory region at 0xfa000000
Attempting to locate BIOS image in PROM... BIOS signature not found
Attempting to locate BIOS image in PRAMIN... appears to be valid

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404045175.4CD62a6b1.25633
Date: Sun, 29 Jun 2014 12:32:55 +0000
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
   title="NEW --- - Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau KMS framebuffer hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">bug 80675</a>
              from <span class="vcard"><a class="email" href="mailto:walter.haidinger&#64;gmx.at" title="Walter Haidinger &lt;walter.haidinger&#64;gmx.at&gt;"> <span class="fn">Walter Haidinger</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=101975" name="attach_101975" title="vbtracetool rom dump">attachment 101975</a> <a href="attachment.cgi?id=101975&amp;action=edit" title="vbtracetool rom dump">[details]</a></span>
vbtracetool rom dump

Created a rom dump as suggested on
<a href="http://nouveau.freedesktop.org/wiki/DumpingVideoBios/">http://nouveau.freedesktop.org/wiki/DumpingVideoBios/</a>

# ./vbtracetool -w 2&gt; 1043-82e2.rom
Using card 10de:0848 on 0200
Nvidia card -- using PROM/PRAMIN BIOS
Using card memory region at 0xfa000000
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

--1404045175.4CD62a6b1.25633--

--===============0709378939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0709378939==--
