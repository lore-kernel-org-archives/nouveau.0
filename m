From: Gianluca Cecchi <gianluca.cecchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: properly check for _DSM function support and Optimus
 support for vga_switcheroo
Date: Mon, 19 Dec 2011 11:04:19 +0100
Message-ID: <CAG2kNCwBwRJ_VrS9NHnmGvOTTLuwmBKd5kG8OknJG+f20Kvqsg@mail.gmail.com>
References: <CALBR5ZxR9iuvT57bDZ8yW9ZkZjuoUhBTYw4HBsmsiwoRi4gSkw@mail.gmail.com>
	<CALBR5ZyE2ZRX7eFBhooB22e9BRf0f3H2xqtvXB2iwe8nvKKnvw@mail.gmail.com>
	<CAOB9epp8EdpetsPStfdnGNx5-2dKi42j3DQiVKN_dzMdFcssWA@mail.gmail.com>
	<CALBR5Zw0gEDqKrSUF3R30tSSC6DUgfhVm0Y1Mp60e4bB4ObijQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CALBR5Zw0gEDqKrSUF3R30tSSC6DUgfhVm0Y1Mp60e4bB4ObijQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

>> On Sat, Dec 17, 2011 at 5:50 PM, Lekensteyn <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>> Hello guys,
>>>
>>> I've prepared a patch based on my findings for the bbswitch module
>>> (https://github.com/Lekensteyn/acpi-stuff/tree/master/bbswitch). This
>>> adds a proper
>>> check whether a _DSM function is supported or not and make OFF / ON for
>>> vga_switcheroo work for nVidia Optimus models. The patch is based against
>>> the
>>> mainline kernel.
>>>
>>> It has been tested on my Clevo B7130 laptop running kernel 3.2 which has

Hello,
I have an Asus U36SD laptop with Optimus and Fedora 16 with kernel
3.1.5-6.fc16.x86_64
Any way I can test it?
Currently  I'm using acpi_call to switch off nvidia card and gain 4w
for more battery life.

[g.cecchi@ope46 ~]$ lspci -vnnn|grep -i vga
00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd
Generation Core Processor Family Integrated Graphics Controller
[8086:0126] (rev 09) (prog-if 00 [VGA controller])
01:00.0 VGA compatible controller [0300]: nVidia Corporation Device
[10de:1050] (rev ff) (prog-if ff)

What benefit would it give me? Chance to use nvidia for graphic
related apps ? With nouveau andor nvidia proprietary driver?
Thanks in advance for any pointer

Gianluca
