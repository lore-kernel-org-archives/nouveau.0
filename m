From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Sat, 03 Jan 2015 07:32:25 +0000
Message-ID: <bug-87885-8800-kAh0U2Obzu@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0938527076=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87885-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0938527076==
Content-Type: multipart/alternative; boundary="1420270344.b7A83Aca1.29771"; charset="UTF-8"


--1420270344.b7A83Aca1.29771
Date: Sat, 3 Jan 2015 07:32:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #11 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to TM from comment #10)
> Thanks for the clarification. I was already suspecting I was doing sth wrong
> :)
> 
> So, after a reboot, here's what nvapeek looks like:
> # ./nvapeek 20000 1000
> 00020000: ca000114 00000018 c00836f7 00009c40
> 00020010: 00000000 fe4c038d 9e9c9a9a fe0202ee
> 00020020: 02080e07 07000a09 000a0802 00050601
> 00020030: 02020801 00091006 15020805 1a056000
> 00020040: 07000201 00ff0239 000000ff 44072a0b
> 00020050: 00000a07 ffffffff ffffffff 00000000
> 00020060: 00040001 40400000 ffff8480 ffffffff
> 00020070: ffffffff 40000104 01100000 00000000
> 00020080: 100c0736 00000000 00000000 00000000
> ...
> 000200a0: 01000000 00000003 c10910de 00000004
> ...
> 00020100: 00000000 1a114c99 082a0000 00000000
> 00020110: 00000000 00000000 00000000 00876530
> 00020120: 00000241 00000200 00000000 00000000
> ...
> 00020400: 00000032 00000000 00000000 00000001
> 00020410: 00000000 00000069 00000000 00000000
> ...
> 00020440: 00000000 00000080 00000000 00000000
> ...
> 00020480: 00000087 0000000a 00000000 00000000
> ...
> 000204c0: 00000068 00000000 00000080 0000005d
> ...
> 000207f0: 00000000 00000000 000010de 00000001
> ...
> 
> # ./nvapeek e114 20
> 0000e114: 00000001 00000000 0000021c 030000bd
> 0000e124: 10000000 00000000 0001010e 00000000

Thank you TM and Ilia!

Ok, so the bits controlling the function to drive the fan to maximum speed when
the temperature exceed a certain threshold are set on your card.

Let's try setting them on Nouveau and see if we can change the fan speed
afterwards:

nvapoke e120 830000bd

If the theory is right, then the fan speed should drop considerably and
Nouveau's auto fan management should then work fine. If this is not the case
then I would like to try the following command when the blob is running
(execute it several times in a row):

nvapoke e120 8300021c

If the fan speed goes to 100% for a second then it means we screwed up some
initial configuration :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420270344.b7A83Aca1.29771
Date: Sat, 3 Jan 2015 07:32:24 +0000
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
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to TM from <a href="show_bug.cgi?id=87885#c10">comment #10</a>)
<span class="quote">&gt; Thanks for the clarification. I was already suspecting I was doing sth wrong
&gt; :)
&gt; 
&gt; So, after a reboot, here's what nvapeek looks like:
&gt; # ./nvapeek 20000 1000
&gt; 00020000: ca000114 00000018 c00836f7 00009c40
&gt; 00020010: 00000000 fe4c038d 9e9c9a9a fe0202ee
&gt; 00020020: 02080e07 07000a09 000a0802 00050601
&gt; 00020030: 02020801 00091006 15020805 1a056000
&gt; 00020040: 07000201 00ff0239 000000ff 44072a0b
&gt; 00020050: 00000a07 ffffffff ffffffff 00000000
&gt; 00020060: 00040001 40400000 ffff8480 ffffffff
&gt; 00020070: ffffffff 40000104 01100000 00000000
&gt; 00020080: 100c0736 00000000 00000000 00000000
&gt; ...
&gt; 000200a0: 01000000 00000003 c10910de 00000004
&gt; ...
&gt; 00020100: 00000000 1a114c99 082a0000 00000000
&gt; 00020110: 00000000 00000000 00000000 00876530
&gt; 00020120: 00000241 00000200 00000000 00000000
&gt; ...
&gt; 00020400: 00000032 00000000 00000000 00000001
&gt; 00020410: 00000000 00000069 00000000 00000000
&gt; ...
&gt; 00020440: 00000000 00000080 00000000 00000000
&gt; ...
&gt; 00020480: 00000087 0000000a 00000000 00000000
&gt; ...
&gt; 000204c0: 00000068 00000000 00000080 0000005d
&gt; ...
&gt; 000207f0: 00000000 00000000 000010de 00000001
&gt; ...
&gt; 
&gt; # ./nvapeek e114 20
&gt; 0000e114: 00000001 00000000 0000021c 030000bd
&gt; 0000e124: 10000000 00000000 0001010e 00000000</span >

Thank you TM and Ilia!

Ok, so the bits controlling the function to drive the fan to maximum speed when
the temperature exceed a certain threshold are set on your card.

Let's try setting them on Nouveau and see if we can change the fan speed
afterwards:

nvapoke e120 830000bd

If the theory is right, then the fan speed should drop considerably and
Nouveau's auto fan management should then work fine. If this is not the case
then I would like to try the following command when the blob is running
(execute it several times in a row):

nvapoke e120 8300021c

If the fan speed goes to 100% for a second then it means we screwed up some
initial configuration :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420270344.b7A83Aca1.29771--

--===============0938527076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0938527076==--
