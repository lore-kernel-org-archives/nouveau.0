From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Enabling Xinerama with nouveau driver causes
 Segmentation fault
Date: Thu, 27 Jun 2013 16:40:33 +0000
Message-ID: <bug-66255-8800-YligETHbuy@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0687459081=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0687459081==
Content-Type: multipart/alternative; boundary="1372351233.81a7A1.20490"; charset="us-ascii"


--1372351233.81a7A1.20490
Date: Thu, 27 Jun 2013 16:40:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #5 from Trev Jackson <trev.g7pvs-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
I've upgraded to 1.0.8 and enabled ZaphodHeads, and it doesn't appear to make
any difference, with the exception that when I get the segmentation error I can
now switch to a terminal using <Ctrl><Alt><F2>.  I'll attach the new Xorg.0.log
and new xorg.conf.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372351233.81a7A1.20490
Date: Thu, 27 Jun 2013 16:40:33 +0000
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
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:trev.g7pvs&#64;ntlworld.com" title="Trev Jackson &lt;trev.g7pvs&#64;ntlworld.com&gt;"> <span class="fn">Trev Jackson</span></a>
</span></b>
        <pre>I've upgraded to 1.0.8 and enabled ZaphodHeads, and it doesn't appear to make
any difference, with the exception that when I get the segmentation error I can
now switch to a terminal using &lt;Ctrl&gt;&lt;Alt&gt;&lt;F2&gt;.  I'll attach the new Xorg.0.log
and new xorg.conf.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372351233.81a7A1.20490--

--===============0687459081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0687459081==--
