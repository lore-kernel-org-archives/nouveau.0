From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37440] Infinite loop detected in fragment program
Date: Thu, 06 Dec 2012 02:49:06 +0000
Message-ID: <bug-37440-8800-dSFbgzdXmH@http.bugs.freedesktop.org/>
References: <bug-37440-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1605123029=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37440-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1605123029==
Content-Type: multipart/alternative; boundary="1354762146.47C02D50.18896"; charset="us-ascii"


--1354762146.47C02D50.18896
Date: Thu, 6 Dec 2012 02:49:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=37440

--- Comment #4 from Andrew Caudwell <acaudwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I believe this is due to a bug in mesa/program/prog_execute.c.

get_dst_register_pointer() returns a dummy register when the dest register
Index exceeds MAX_PROGRAM_TEMPS (currently set to 256). Perhaps this should be
an error or an assertion failure instead.

Raising the value of MAX_PROGRAM_TEMPS worked around the infinite loop in my
case.

I also needed to increase INST_INDEX_BITS to avoid an intermitant assertion
failure from mesa_src_reg_from_ir_src_reg(), though this may not be directly
related.

Mesa 9.1-devel using OSMesa.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354762146.47C02D50.18896
Date: Thu, 6 Dec 2012 02:49:06 +0000
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
   title="NEW --- - Infinite loop detected in fragment program"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37440#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Infinite loop detected in fragment program"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37440">bug 37440</a>
              from <span class="vcard"><a class="email" href="mailto:acaudwell&#64;gmail.com" title="Andrew Caudwell &lt;acaudwell&#64;gmail.com&gt;"> <span class="fn">Andrew Caudwell</span></a>
</span></b>
        <pre>I believe this is due to a bug in mesa/program/prog_execute.c.

get_dst_register_pointer() returns a dummy register when the dest register
Index exceeds MAX_PROGRAM_TEMPS (currently set to 256). Perhaps this should be
an error or an assertion failure instead.

Raising the value of MAX_PROGRAM_TEMPS worked around the infinite loop in my
case.

I also needed to increase INST_INDEX_BITS to avoid an intermitant assertion
failure from mesa_src_reg_from_ir_src_reg(), though this may not be directly
related.

Mesa 9.1-devel using OSMesa.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354762146.47C02D50.18896--

--===============1605123029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1605123029==--
