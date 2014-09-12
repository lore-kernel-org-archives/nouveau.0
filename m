From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
	(also NV44A)
Date: Fri, 12 Sep 2014 13:37:14 +0000
Message-ID: <bug-70388-8800-Ds54bTpbIm@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1936981273=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1936981273==
Content-Type: multipart/alternative; boundary="1410529034.6Ea5b2.1319"; charset="us-ascii"


--1410529034.6Ea5b2.1319
Date: Fri, 12 Sep 2014 13:37:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #30 from Sergii Stepanenko <sergstepanenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hello all!
I have same problem on my system with 3 old PCIe NV4B cards. Tested with kernel
3.16.2 and Mesa 10.2.7, with kernel 3.14.11 and Mesa 10.2.2.

After boot I have many errors in dmesg
nouveau E[   PFIFO][0000:03:00.0] CACHE_ERROR - ch 1 [X[1450]] subc 5 mthd
0x019c data 0x80000010
where "ch" and "subc" are different, but always with 2nd or 3rd card.
Everything works well. Then I run any application that uses the GL (for example
glxgears). After an interruption of the application system freezes. Then I see
few
nouveau E[glxgears[1467]] failed to idle channel 0xcccc0000 [glxgears[1467]] in
dmesg.
I have tried with nouveau.vram_pushbuf=1, but have same errors.

Full dmesg log: https://drive.google.com/file/d/0B6qNYzhc-QU-eHo5aDNhOWlxc00
Full Xorg.log:  https://drive.google.com/file/d/0B6qNYzhc-QU-ZWdqdFRCNjlkeWs

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410529034.6Ea5b2.1319
Date: Fri, 12 Sep 2014 13:37:14 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:sergstepanenko&#64;gmail.com" title="Sergii Stepanenko &lt;sergstepanenko&#64;gmail.com&gt;"> <span class="fn">Sergii Stepanenko</span></a>
</span></b>
        <pre>Hello all!
I have same problem on my system with 3 old PCIe NV4B cards. Tested with kernel
3.16.2 and Mesa 10.2.7, with kernel 3.14.11 and Mesa 10.2.2.

After boot I have many errors in dmesg
nouveau E[   PFIFO][0000:03:00.0] CACHE_ERROR - ch 1 [X[1450]] subc 5 mthd
0x019c data 0x80000010
where &quot;ch&quot; and &quot;subc&quot; are different, but always with 2nd or 3rd card.
Everything works well. Then I run any application that uses the GL (for example
glxgears). After an interruption of the application system freezes. Then I see
few
nouveau E[glxgears[1467]] failed to idle channel 0xcccc0000 [glxgears[1467]] in
dmesg.
I have tried with nouveau.vram_pushbuf=1, but have same errors.

Full dmesg log: <a href="https://drive.google.com/file/d/0B6qNYzhc-QU-eHo5aDNhOWlxc00">https://drive.google.com/file/d/0B6qNYzhc-QU-eHo5aDNhOWlxc00</a>
Full Xorg.log:  <a href="https://drive.google.com/file/d/0B6qNYzhc-QU-ZWdqdFRCNjlkeWs">https://drive.google.com/file/d/0B6qNYzhc-QU-ZWdqdFRCNjlkeWs</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410529034.6Ea5b2.1319--

--===============1936981273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1936981273==--
