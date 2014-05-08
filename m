From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] X does not start under kernel 3.13.x
Date: Thu, 08 May 2014 14:01:41 +0000
Message-ID: <bug-78441-8800-bhpRihVuMC@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1412664411=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1412664411==
Content-Type: multipart/alternative; boundary="1399557700.AfBB1.17388"; charset="us-ascii"


--1399557700.AfBB1.17388
Date: Thu, 8 May 2014 14:01:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There does not appear to be any indication of a G86 card in your computer. PCI
ID 10de:01d7 corresponds to G72 [Quadro NVS 110M / GeForce Go 7300] according
to http://envytools.readthedocs.org/en/latest/pciid.html. And we read that it's
a NV46 ( = G72) from the card's mmio register 0, further confirming that it's a
G72...

Can you provide the output of "lspci -nn"?

The only relevant change between 3.12 and 3.13 that I can think of is that we
added support for MSI. You can try disabling it by adding

nouveau.config=NvMSI=0

to your kernel commandline. If that doesn't help, you'll have to do a bisect.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399557700.AfBB1.17388
Date: Thu, 8 May 2014 14:01:40 +0000
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
   title="NEW --- - X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There does not appear to be any indication of a G86 card in your computer. PCI
ID 10de:01d7 corresponds to G72 [Quadro NVS 110M / GeForce Go 7300] according
to <a href="http://envytools.readthedocs.org/en/latest/pciid.html">http://envytools.readthedocs.org/en/latest/pciid.html</a>. And we read that it's
a NV46 ( = G72) from the card's mmio register 0, further confirming that it's a
G72...

Can you provide the output of &quot;lspci -nn&quot;?

The only relevant change between 3.12 and 3.13 that I can think of is that we
added support for MSI. You can try disabling it by adding

nouveau.config=NvMSI=0

to your kernel commandline. If that doesn't help, you'll have to do a bisect.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399557700.AfBB1.17388--

--===============1412664411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1412664411==--
