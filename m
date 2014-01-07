From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] [NV98] hangs in nvbios_init on probe (worked
	in 3.2)
Date: Tue, 07 Jan 2014 20:01:10 +0000
Message-ID: <bug-72943-8800-piIfrFEkzb@http.bugs.freedesktop.org/>
References: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0078435153=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72943-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0078435153==
Content-Type: multipart/alternative; boundary="1389124870.1eF41.11624"; charset="us-ascii"


--1389124870.1eF41.11624
Date: Tue, 7 Jan 2014 20:01:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72943

--- Comment #14 from Ionut Radu <ionut.radu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Hi Ilia,

It's very likely to be the same issue. I have the same graphic card  
as Darcy and slightly different vbios version. 
I'm sure I have applied the patch correctly. In fact the original kernel is
3.13.0...fc21, while I have compiled it on Fedora 20 and it got the fc20
suffix.
I'll try to obtain a vbios.rom file.
Regarding debug=trace, I have issues with journalctl flooding, and the vmcore
log 
gets truncated with no useful information added.
Can't you use vmcore to debug the issue ? It should contain enough information.

thanks,
Ionut Radu.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389124870.1eF41.11624
Date: Tue, 7 Jan 2014 20:01:10 +0000
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
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943">bug 72943</a>
              from <span class="vcard"><a class="email" href="mailto:ionut.radu&#64;gmail.com" title="Ionut Radu &lt;ionut.radu&#64;gmail.com&gt;"> <span class="fn">Ionut Radu</span></a>
</span></b>
        <pre>
Hi Ilia,

It's very likely to be the same issue. I have the same graphic card  
as Darcy and slightly different vbios version. 
I'm sure I have applied the patch correctly. In fact the original kernel is
3.13.0...fc21, while I have compiled it on Fedora 20 and it got the fc20
suffix.
I'll try to obtain a vbios.rom file.
Regarding debug=trace, I have issues with journalctl flooding, and the vmcore
log 
gets truncated with no useful information added.
Can't you use vmcore to debug the issue ? It should contain enough information.

thanks,
Ionut Radu.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389124870.1eF41.11624--

--===============0078435153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0078435153==--
