From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Thu, 18 Jul 2013 20:53:57 +0000
Message-ID: <bug-64774-8800-1Yidb0RMGM@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0166633022=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0166633022==
Content-Type: multipart/alternative; boundary="1374180837.1878b62.20265"; charset="us-ascii"


--1374180837.1878b62.20265
Date: Thu, 18 Jul 2013 20:53:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64774

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
That last dmesg looks fine... what's the problem? (It seems unlikely that
merely adding a WARN_ON that never fires would fix things, points to a compiler
issue? Or a different config/compilation mechanism/??)

You now have an intel and nvidia devices. I think it starts out with the intel
device, you can use the regular vga_switcheroo mechanisms to switch to the
nvidia device. Some docs about it are available at
https://help.ubuntu.com/community/HybridGraphics. If you're aware of all that,
can you be more specific as to what you're doing and what exactly doesn't work?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374180837.1878b62.20265
Date: Thu, 18 Jul 2013 20:53:57 +0000
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
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774">bug 64774</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>That last dmesg looks fine... what's the problem? (It seems unlikely that
merely adding a WARN_ON that never fires would fix things, points to a compiler
issue? Or a different config/compilation mechanism/??)

You now have an intel and nvidia devices. I think it starts out with the intel
device, you can use the regular vga_switcheroo mechanisms to switch to the
nvidia device. Some docs about it are available at
<a href="https://help.ubuntu.com/community/HybridGraphics">https://help.ubuntu.com/community/HybridGraphics</a>. If you're aware of all that,
can you be more specific as to what you're doing and what exactly doesn't work?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374180837.1878b62.20265--

--===============0166633022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0166633022==--
