From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73342] [NV86] yuy2 overlay in mame displays as black
Date: Sun, 19 Jan 2014 19:31:50 +0000
Message-ID: <bug-73342-8800-bDrrwYnngA@http.bugs.freedesktop.org/>
References: <bug-73342-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1188254198=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73342-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1188254198==
Content-Type: multipart/alternative; boundary="1390159910.82F148E1.26129"; charset="us-ascii"


--1390159910.82F148E1.26129
Date: Sun, 19 Jan 2014 19:31:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73342

--- Comment #3 from fbs777-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Well, after some tests, some news.

What works (all 32 bits): 

 - hardware 1: Ubuntu 11.10 with nouveau (from ubuntu 11.10 repository) and
geforce 8500GT Chipset: G86 (NV86) , Family : NV50

 - hardware 1: Ubuntu 13.04 with nouveau (from ubuntu 13.04 repository) and
geforce 8500GT Chipset: G86 (NV86) , Family : NV50

 - hardware 2: Ubuntu 13.10 with i915 driver (netbook with onboard intel video)

 - hardware 3: Ubuntu 13.10 with nouveau (from ubuntu 13.10 repository) and
onboard geforce 6150SE nforce nv430 Chipset: C61 (NV4C) , Family : NV40


What dont works (32 bits):

 - hardware 1: Ubuntu 13.10 with nouveau (from ubuntu 13.10 repository) and
geforce 8500GT Chipset: G86 (NV86) , Family : NV50


So, the same hardware 1 works with ubuntu 13.04 + nouveau and old versions, but
dont work with ubuntu 13.10 + nouveau. And the hardware 3 works with the same
hd with ubuntu 13.10 + nouveau that dont work on hardware 1.

The only combination that dont work is the ubuntu 13.10 + nouveau with geforce
8500GT Chipset: G86 (NV86) , Family : NV50

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390159910.82F148E1.26129
Date: Sun, 19 Jan 2014 19:31:50 +0000
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
   title="NEW --- - [NV86] yuy2 overlay in mame displays as black"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73342#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] yuy2 overlay in mame displays as black"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73342">bug 73342</a>
              from <span class="vcard"><a class="email" href="mailto:fbs777&#64;gmail.com" title="fbs777&#64;gmail.com">fbs777&#64;gmail.com</a>
</span></b>
        <pre>Well, after some tests, some news.

What works (all 32 bits): 

 - hardware 1: Ubuntu 11.10 with nouveau (from ubuntu 11.10 repository) and
geforce 8500GT Chipset: G86 (NV86) , Family : NV50

 - hardware 1: Ubuntu 13.04 with nouveau (from ubuntu 13.04 repository) and
geforce 8500GT Chipset: G86 (NV86) , Family : NV50

 - hardware 2: Ubuntu 13.10 with i915 driver (netbook with onboard intel video)

 - hardware 3: Ubuntu 13.10 with nouveau (from ubuntu 13.10 repository) and
onboard geforce 6150SE nforce nv430 Chipset: C61 (NV4C) , Family : NV40


What dont works (32 bits):

 - hardware 1: Ubuntu 13.10 with nouveau (from ubuntu 13.10 repository) and
geforce 8500GT Chipset: G86 (NV86) , Family : NV50


So, the same hardware 1 works with ubuntu 13.04 + nouveau and old versions, but
dont work with ubuntu 13.10 + nouveau. And the hardware 3 works with the same
hd with ubuntu 13.10 + nouveau that dont work on hardware 1.

The only combination that dont work is the ubuntu 13.10 + nouveau with geforce
8500GT Chipset: G86 (NV86) , Family : NV50</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390159910.82F148E1.26129--

--===============1188254198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1188254198==--
