From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Questions about the Nouveau VM subsystem
Date: Wed, 16 Jul 2014 17:20:40 +0900
Message-ID: <53C635D8.8020604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi everyone,

I have been studing the VM code in order to come with a better 
implementation of my fix for large pages usage on GK20A 
(https://lkml.org/lkml/2014/6/3/375 ). Following some older threads 
about this code (http://marc.info/?l=dri-devel&m=137618326022935 ) also 
left me kind of puzzled, and I wonder if we could not simplify and 
improve things there.

It seems like arbitrary constant values for page_shifts (usually 12) are 
used where the vmm->spg_shift value should be used instead, and some 
other members are used out of place. Here are a few questions to start:

- What is nouveau_mem::page_shift exactly used for? It is set here and 
there but never really used, and usually the value it is set to does not 
seem to bother how the memory is allocated. For instance 
nouveau_vram_manager_new() will set it to whatever page_shift the BO 
has. I *thought* it should indicate the size and alignment of the pages 
described in the nouveau_mem object. Is this definition correct? In that 
case, shouldn't the memory allocator be the one that sets that field, 
instead of the callers?

- In nouveau_vm_map*(), why are we using vma->node->type to decide 
whether to use the small or big pages table? It seems like this should 
rather be decided by mem->page_shift, and more generally by how 
contiguous the physical memory is, in order to maximize large pages use 
whenever possible. Right now the issue that we have is that if the 
memory allocator returns 4k pages, and the VMA used to map this memory 
uses 128k pages, we are mapping 4k pages at 128k interval, which cannot 
end well.

Generally speaking it seems like the VM subsystem allows plenty of 
specific cases to fail silently, and since I need to fix a few to allow 
GK20A to operate I could as well try to fix them all. Answers to the 
questions above and general opinions about the state of this code would 
help me understand what needs to be done. :)

Thanks,
Alex.
