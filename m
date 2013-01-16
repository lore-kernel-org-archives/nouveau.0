From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Wed, 16 Jan 2013 20:27:35 +0000
Message-ID: <bug-59069-8800-jplTG7ZEFZ@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1641223196=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1641223196==
Content-Type: multipart/alternative; boundary="1358368055.AE1c3c2.29782"; charset="us-ascii"


--1358368055.AE1c3c2.29782
Date: Wed, 16 Jan 2013 20:27:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

--- Comment #19 from Jacopo Moronato <jmoronat-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 73165
  --> https://bugs.freedesktop.org/attachment.cgi?id=73165&action=edit
dmesg with logging v2 patch

I successfully built v2 patch on top of latest 3.7.0.x available kernel for
Raring. 
This patch seems to cause an XServer crash, whenever I launch the Dash (talking
about Unity desktop environment).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358368055.AE1c3c2.29782
Date: Wed, 16 Jan 2013 20:27:35 +0000
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
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:jmoronat&#64;gmail.com" title="Jacopo Moronato &lt;jmoronat&#64;gmail.com&gt;"> <span class="fn">Jacopo Moronato</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=73165" name="attach_73165" title="dmesg with logging v2 patch">attachment 73165</a> <a href="attachment.cgi?id=73165&amp;action=edit" title="dmesg with logging v2 patch">[details]</a></span>
dmesg with logging v2 patch

I successfully built v2 patch on top of latest 3.7.0.x available kernel for
Raring. 
This patch seems to cause an XServer crash, whenever I launch the Dash (talking
about Unity desktop environment).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358368055.AE1c3c2.29782--

--===============1641223196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1641223196==--
